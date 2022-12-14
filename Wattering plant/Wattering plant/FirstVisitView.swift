//
//  NamePersonView.swift
//  Wattering plant
//
//  Created by Narely Lima on 12/09/22.
//

import SwiftUI


struct FirstVisitView: View {
    
    let darkgreen = Color(red: 77/255, green: 93/255, blue: 83/255)
    let lightgreen = Color(red: 143/255, green: 151/255, blue: 121/255)
    let darkgray = Color(red: 48/255, green: 48/255, blue: 48/255)
    
    @State var offset : CGSize = .zero
    @State var showHome = false
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color(red: 77/255, green: 93/255, blue: 83/255)
                
                .clipShape(LiquidSwipe(offset: offset))
                .ignoresSafeArea()
                .overlay(
                
                    Image(systemName: "chevron.left")
                        .font(.title.bold())
                        .foregroundColor(darkgreen)
                        .frame(width: 50, height: 50)
                        .contentShape(Rectangle())
                        .gesture(DragGesture().onChanged({ (value) in
                            
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                offset = value.translation
                            }
                            
                        }).onEnded({(value) in
                            
                            let screen = UIScreen.main.bounds
                            
                            withAnimation(.spring()){
                                
                                if -offset.width > screen.width / 2 {
                                    offset.width = -screen.height
                                    showHome.toggle()
                                } else {
                                    offset = .zero
                                }

                            }
                        }))
                        .offset(x: 15, y: -40)
                        .foregroundColor(.white)
                        .opacity(offset == .zero ? 1 : 0)
                    
                    ,alignment: .topTrailing
                )
                .padding(.trailing)
                
                if showHome {
                    PersonNameView()
                }
                
                VStack {

                    Spacer().frame(height: 120)
                    Text("Antes de iniciarmos, precisamos de tr??s informa????es.")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(.system(size: 25, design: .rounded))
                        .padding(.trailing)
                        .offset(x: -15)
                        .gesture(DragGesture().onChanged({ (value) in
                            
                            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
                                offset = value.translation
                            }
                            
                        }).onEnded({(value) in
                            
                            let screen = UIScreen.main.bounds
                            
                            withAnimation(.spring()){
                                
                                if -offset.width > screen.width / 2 {
                                    offset.width = -screen.height
                                    showHome.toggle()
                                } else {
                                    offset = .zero
                                }

                            }
                        }))
                        .offset(x: 15, y: -40)
                        .foregroundColor(.white)
                        .opacity(offset == .zero ? 1 : 0)
                    
                    Spacer().frame(height: 100)
                
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }

}

struct FirstVisitView_Preview : PreviewProvider {
    static var previews: some View {
        FirstVisitView()
    }
}

struct LiquidSwipe: Shape {

    var offset : CGSize
    
    var animatableData: CGSize.AnimatableData {
        get{return offset.animatableData}
        set{offset.animatableData = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{path in

            
            let width = rect.width + (-offset.width >  0 ? offset.width : 0)
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let from = 80 + (offset.width)
            
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))
            
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            let mid : CGFloat = 80 + ((to - 80) / 2)
  
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - 50, y: mid), control2: CGPoint(x: width - 50, y: mid))
            
        }
    }
}

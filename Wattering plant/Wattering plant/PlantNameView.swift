//
//  PlantNameView.swift
//  Wattering plant
//
//  Created by Narely Lima on 13/09/22.
//

import SwiftUI

struct PlantNameView: View {
    
    @State var textFieldPlant: String = ""
    
    let darkgreen = Color(red: 77/255, green: 93/255, blue: 83/255)
    let graygreen = Color(red: 115/255, green: 130/255, blue: 118/255)
    
    var body: some View {
        
        NavigationView {
            
            ZStack (alignment: .top) {
                Color(.white).ignoresSafeArea()
                
                VStack {
                    
                    Text("Qual o nome da sua plantinha?")
                        .foregroundColor(darkgreen)
                        .font(.system(size: 20, design: .rounded))

                    TextField(" ", text: $textFieldPlant)
                        .foregroundColor(graygreen)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, design: .rounded))
                        .padding()

                    
                    Divider()
                        
                        .background(Color(red: 77/255, green: 93/255, blue: 83/255))
                        .frame(width: 350)
                        
                    
                    
                    Spacer().frame(height: 100)

                    NavigationLink(destination: PlantType().navigationBarHidden(true), label: {
                        Text("Próximo")
                        .foregroundColor(darkgreen)
                            .padding()
                            .frame(width: 200, height: 50)
                            .font(.system(size: 20, design: .rounded))
                            .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(darkgreen, lineWidth: 2)

                            )
                            .padding()
                            .background(.white)
                            .cornerRadius(20)
                        }
                    )
                        }
                
                .padding()
                    
                }
                Spacer().frame(height: 484)
            }
        }
    }


struct PlantNameView_Previews: PreviewProvider {
    static var previews: some View {
        PlantNameView()
    }
}

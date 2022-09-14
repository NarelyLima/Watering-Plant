//
//  PlantType.swift
//  Wattering plant
//
//  Created by Maria Letícia Dutra de Oliveira on 13/09/22.
//

import SwiftUI

struct PlantType: View {
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    let darkgreen = Color(red: 9/255, green: 82/255, blue: 86/255)
    @State var selected : Plants = PlantsType[0]
    @State var show = false
    @Namespace var namespace
    
    var scroll : some View {
        ScrollView(.vertical, showsIndicators: false){
            
            LazyVGrid(columns: columns, spacing: 15){
                
                ForEach(PlantsType){ plant in
                    
                    VStack (alignment: .center, spacing: 10){
                        
                        Image(plant.image)
                            .resizable()
                            .frame(height: 180)
                            .cornerRadius(15)
                            .onTapGesture {
                                
                                withAnimation(.spring()){
                                    
                                    show.toggle()
                                    selected = plant
                                    
                                }
                                
                            }
                            .matchedGeometryEffect(id: plant.id, in: namespace)
                        
                        Text(plant.type)
                            .font(.system(size: 20, weight: .bold))
                    }
                    
                }
                
            }
            .padding(.horizontal)
        }
    }
    var select : some View {
        
            VStack{

                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                        
                    Image(selected.image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .matchedGeometryEffect(id: selected.id, in: namespace)
                    
                    HStack {
                        
                        Button{
                            
                            withAnimation(.spring()){
                                
                                show.toggle()
                                
                            }
                            
                        } label: {
                        
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 300, height: 464)
                                .foregroundColor(.white.opacity(0))
                        
                        }
                        
                    }

                }
                
                VStack (alignment: .center){
                    
                    NavigationLink (
                        destination : SplashLoading(),
                            label : {
                                Text ("Pronto!")
                                    
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(darkgreen)
                                    .padding()
                                    .frame(width: 130, height: 60, alignment: .center)
                                    .overlay(RoundedRectangle(cornerRadius: 25)
                                                .stroke(darkgreen, lineWidth: 5))
                                
                    })
                        .navigationBarBackButtonHidden(true)
                    
                    Spacer()
                    
                    }
                
            }

        }
    
    
    var body: some View {
        
        VStack {
                
            Spacer()
            
                Text("Escolha a sua plantinha")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.black)
            
            .padding([.leading,.top])
            
            scroll
            
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            if show {
                
                select
            }
            
            
        }
        .background(.white)
    }
}

struct PlantType_Previews: PreviewProvider {
    static var previews: some View {
        PlantType()
    }
}

struct Plants : Identifiable {
    
    var id: Int
    var type: String
    var image: String
    
}

var PlantsType = [
    
Plants(id: 0, type: "Flor", image: "flower"),
Plants(id: 1, type: "Suculenta", image: "plant"),
Plants(id: 2, type: "Frutífera", image: "fruit"),
Plants(id: 3, type: "Cacto", image: "cactus")

]


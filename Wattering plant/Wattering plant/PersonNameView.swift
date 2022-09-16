//
//  PersonNameView.swift
//  Wattering plant
//
//  Created by Narely Lima on 12/09/22.
//

import Foundation
import SwiftUI

struct PersonNameView: View {
    
    var body: some View {
        
        NavigationView {
            
            ZStack (alignment: .top){
                Color(.white).ignoresSafeArea()
                
                NameUser()
                
            }

        }.navigationBarBackButtonHidden(true)
    }
}

struct NameUser : View {
    
    @State var textFieldPerson: String = ""
    
    let darkgreen = Color(red: 77/255, green: 93/255, blue: 83/255)
    let graygreen = Color(red: 115/255, green: 130/255, blue: 118/255)
    
    var body: some View {
    
    VStack {
        
        Text("Qual o seu nome?")
            .foregroundColor(Color(red: 77/255, green: 93/255, blue: 83/255))
            .font(.system(size: 20, design: .serif))

        TextField(" ", text: $textFieldPerson)
            .multilineTextAlignment(.center)
            .foregroundColor(graygreen)
            .font(.system(size: 15, design: .serif))
            .padding()

        
        Divider()
            
            .background(Color(red: 77/255, green: 93/255, blue: 83/255))
            .frame(width: 350)
            
        
        
        Spacer().frame(height: 100)

        NavigationLink(destination: PlantNameView().navigationBarHidden(true), label: {
            Text("Próximo")
            .foregroundColor(darkgreen)
                .padding()
                .frame(width: 200, height: 50)
                .font(.system(size: 18, design: .serif))
                .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(darkgreen, lineWidth: 2)

                )
                .padding()
                .background(.white)
                .cornerRadius(20)
            }
        )
        
        Spacer().frame(height: 146)
        
        }
    }
    
}

struct PersonNameView_Preview : PreviewProvider {
    static var previews: some View {
        PersonNameView()
    }
}



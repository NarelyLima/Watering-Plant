//
//  PersonNameView.swift
//  Wattering plant
//
//  Created by Narely Lima on 12/09/22.
//

import Foundation
import SwiftUI

struct PersonNameView: View {
    @State var textFieldPerson: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 223/255, green: 255/255, blue: 214/255).ignoresSafeArea()
                VStack {
                    Text("Qual o seu nome?")
                        .foregroundColor(Color(red: 9/255, green: 82/255, blue: 86/255))
                        .fontWeight(.bold)
                        .font(.system(size: 30, design: .serif))
                    Spacer().frame(height: 50)
                    TextField("Seu nome ♡", text: $textFieldPerson)
                        .padding()
                        .font(.headline)
                        .foregroundColor(Color(red: 223/255, green: 255/255, blue: 214/255))
                        .background(Color.white)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(15)
                    Spacer().frame(height: 90)
                    NavigationLink(destination: PlantNameView(), label: {
                            Text("Próximo!")
                                .foregroundColor(Color(red: 223/255, green: 255/255, blue: 214/255))
                                .font(.system(size: 20, design: .serif))
                                .padding()
                                .background(Color(red: 9/255, green: 82/255, blue: 86/255))
                                .cornerRadius(20)
                        }
                    )
                }
                .padding()
            }
        }
    }
}
struct PersonNameView_Preview : PreviewProvider {
    static var previews: some View {
        PersonNameView()
    }
}

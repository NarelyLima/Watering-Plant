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
            ZStack {
                Color(red: 223/255, green: 255/255, blue: 214/255).ignoresSafeArea()
                VStack {
                    Text("Qual o seu nome?")
                        .foregroundColor(Color(red: 9/255, green: 82/255, blue: 86/255))
                        .font(Font.custom("Helvetica Neue", size: 30))
                        .fontWeight(.bold)
                    Spacer().frame(height: 50)
                    Text("___________________________________")
                    Spacer().frame(height: 90)
                    NavigationLink(destination: PersonNameView(), label: {
                            Text("Próximo!")
                                .foregroundColor(Color(red: 223/255, green: 255/255, blue: 214/255))
                                .font(.title)
                                .padding()
                                .background(Color(red: 9/255, green: 82/255, blue: 86/255))
                                .cornerRadius(40)
                        }
                    )
                }
            }
        }
    }
}
struct PersonNameView_Preview : PreviewProvider {
    static var previews: some View {
        PersonNameView()
    }
}

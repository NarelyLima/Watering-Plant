//
//  NamePersonView.swift
//  Wattering plant
//
//  Created by Narely Lima on 12/09/22.
//

import SwiftUI


struct FirstVisitView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 223/255, green: 255/255, blue: 214/255).ignoresSafeArea()
                VStack {
                    Image("iconSplash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    Spacer().frame(height: 120)
                    Text("Antes de iniciarmos, precisamos de quatro informações...")
                        .foregroundColor(Color(red: 9/255, green: 82/255, blue: 86/255))
                        .font(Font.custom("Helvetica Neue", size: 30))
                        .fontWeight(.bold)
                    Spacer().frame(height: 50)
                    NavigationLink(destination: PersonNameView(), label: {
                            Text("Vamos lá!")
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

struct FirstVisitView_Preview : PreviewProvider {
    static var previews: some View {
        FirstVisitView()
    }
}

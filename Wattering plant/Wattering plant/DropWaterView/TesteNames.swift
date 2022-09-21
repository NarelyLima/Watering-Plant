//
//  Teste.swift
//  Wattering plant
//
//  Created by Narely Lima on 21/09/22.
//

import SwiftUI

struct TesteNames: View {
    @State var name: String = ""
    @State var plantName: String = ""
    var body: some View {
        NavigationView{
            VStack {
                TextField("Name", text: $name)
                    .padding()
                TextField("PlantName", text: $plantName)
                    .padding()
                NavigationLink(destination: PrincipalView(name: name, plantName: plantName)) {
                    Text("Vá pra tela principal")
                        .foregroundColor(Color.red)
                }
                
            }
        }
    }
}

struct TesteNames_Previews: PreviewProvider {
    static var previews: some View {
        TesteNames()
    }
}

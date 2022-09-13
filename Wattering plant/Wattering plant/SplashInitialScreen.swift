//
//  ViewController.swift
//  Wattering plant
//
//  Created by Maria Letícia Dutra de Oliveira on 06/09/22.
//

import SwiftUI

struct SplashInitialScreen: View {
    @State private var isActive = false
    @State private var size = 0.05
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            FirstVisitView()
        } else {
            VStack {
                VStack {
                    Image("iconSplash")
                    Text("Watering Plant")
                        .font(Font.custom("New York", size: 100))
                        .fontWeight(.semibold)
                        .frame(width: 700)
                        .foregroundColor(Color(red: 9/255, green: 82/255, blue: 86/255))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.3)) {
                    self.size = 0.30
                    self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashInitialScreen_Previews : PreviewProvider {
    static var previews: some View {
        SplashInitialScreen()
    }
}


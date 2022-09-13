//
//  SplashLoading.swift
//  Wattering plant
//
//  Created by Maria Letícia Dutra de Oliveira on 12/09/22.
//

import SwiftUI
import Lottie

struct SplashLoading: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(
                    red: 255/255,
                    green: 215/255,
                    blue: 213/255
                ).ignoresSafeArea(.all)
                VStack {
                    
                    LottieView()
                        .frame(width: 500, height: 500, alignment: .topLeading)
                    
                    SecondLottieView()
                        .frame(width: 200, height: 200, alignment: .bottomLeading)
                    
                }
                .navigationTitle("")
            }
        }
    }
}


struct SplashLoading_Previews: PreviewProvider {
    static var previews: some View {
        SplashLoading()
    }
}

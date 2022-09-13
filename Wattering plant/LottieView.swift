//
//  LottieView.swift
//  Wattering plant
//
//  Created by Maria Letícia Dutra de Oliveira on 12/09/22.
//

import Lottie
import SwiftUI
import UIKit

struct LottieView: UIViewRepresentable {
  func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let fileName: String = "planting"
      
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        animationView.animation = Animation.named(fileName)
        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
      NSLayoutConstraint.activate([
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
      ])
      
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        //nothing
    }

    
    
}

struct SecondLottieView: UIViewRepresentable {
func makeUIView(context: UIViewRepresentableContext<SecondLottieView>) -> some UIView {
      let secondFileName: String = "loadingwater"
      
      let view = UIView(frame: .zero)
      
      let secondAnimationView = AnimationView()
      secondAnimationView.animation = Animation.named(secondFileName)
      secondAnimationView.contentMode = .scaleAspectFit
      secondAnimationView.play()
      view.addSubview(secondAnimationView)
      
      secondAnimationView.translatesAutoresizingMaskIntoConstraints = false
      
    NSLayoutConstraint.activate([
      secondAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
      secondAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
    ])
      
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<SecondLottieView>) {
        //nothing
    }

    
    
}

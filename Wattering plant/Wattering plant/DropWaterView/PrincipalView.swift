//
//  PrincipalView.swift
//  Wattering plant
//
//  Created by Narely Lima on 14/09/22.
//

import Foundation
import SwiftUI
import SceneKit
import AVFoundation
import SpriteKit




struct PrincipalView: View {
    @State var modelo = Model(id: 0, modelName: "Lowpoly_tree_sample.dae")
    @State var progress: CGFloat = 0.1
    @State var startAnimation: CGFloat = 0
    @State var isComplete: Bool = false
    @State var isSucess: Bool = false
    @State var isPressed: Bool = false
    @State var audioPlayer: AVAudioPlayer?
    @State var audioPlayer2: AVAudioPlayer?
    @State var tarefa = "Esperamos que voce goste da sua primeira, de muitas, experiência com nosso aplicativo"
    @State var dayWatering = ""

    let name: String
    let plantName: String
    @State var date = Date()



    var rainLightningScene: SKScene {
        let scene = RainLightningScene.shared
        scene.size = UIScreen.screenSize
        scene.scaleMode = .fill
        return scene
    }
    //    var items = [InfoUser]()

    let timer = Timer.publish(every: 0.003, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack(alignment: .bottom) {
            background
            VStack {
                Text(tarefa)
                    .frame(width: UIScreen.main.bounds.width*0.9)
                Text(dayWatering)
                    .frame(width: UIScreen.main.bounds.width*0.9)
                treeView
            }
            if !isComplete {
                waterWaveView
            }
            button
            if isComplete {
                animationRainView
                if isSucess {
                    animationRainView
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            //MUSICA DA AGUA SUBINDO
            let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "WaterSound", ofType: "mp3")!)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)
            }catch {
                print("there was some error. The error was \(error)")
            }
        }
        .onReceive(timer) { _ in
            if isPressed {
                withAnimation(Animation.easeInOut(duration: 2)) {
                    if progress >= 0.5 {
                        isComplete = true
                        isPressed = false
                        audioPlayer?.stop()

                    } else {
                        progress += 0.0003
                        isComplete = false
                    }
                }
            }
        }
    }

    var background: some View {
        LinearGradient(colors: [Color(red: 223/255, green:255/255, blue: 214/255), Color(red: 9/255, green: 82/255, blue: 86/255)],
                       startPoint: .top,
                       endPoint: .center)
        .ignoresSafeArea()
    }
    var treeView: some View {
        //INSERÇÃO DO MODELO 3D
        LegacySceneView(scene: {
            let scene = SCNScene(named: modelo.modelName)!
            scene.background.contents = UIColor.clear
            return scene
        }(),
                        options: [.autoenablesDefaultLighting, .allowsCameraControl])
        .frame(width: UIScreen.main.bounds.width / 0.9, height: UIScreen.main.bounds.height / 1.5 , alignment: .center)

    }
    var waterWaveView: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            //FUNCAO QUE PERMITE QUE A ONDA CRESÇA
            WaterWave(progress: progress, waveHeight: 0.025, offset: startAnimation)
                .fill(Color.blue)
                .opacity(0.5)
                .ignoresSafeArea()
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear{
                    withAnimation(.linear(duration: 9).repeatForever(autoreverses: false)){
                        startAnimation = size.width
                    }
                }
        }
    }
    var animationRainView: some View {
        //ANIMAÇÃO DA CHUVA
        SpriteView(scene: rainLightningScene, options: [.allowsTransparency])
            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
            .ignoresSafeArea()
            .onAppear {
                //SOM DO DONE
                let soundURL2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "DoneSound", ofType: "mp3")!)
                do{
                    audioPlayer2 = try AVAudioPlayer(contentsOf: soundURL2 as URL)
                    audioPlayer2?.play()
                }catch {
                    print("there was some error. The error was \(error)")
                }
            }
            .onAppear{
                //DEFINE O TEMPO DE PERMANENCIA DAS GOTINHAS
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.startAnimation = 0
                    self.isSucess = true
                    self.isComplete = false
                    self.progress = 0.1
                    self.tarefa = "Bom dia \(name)! \(plantName) está sem ser aguada desde: "
                    self.dayWatering = "\(Date.now.formatted(.dateTime.weekday(.wide).hour().minute().second()))"
                }
            }
            .onDisappear() {
                self.isSucess = false
            }
    }

    var onHoldGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged ({ _ in
                // HABILITAR INCREMENTO
                isPressed = true
                audioPlayer?.play()
                // iniciar o timer
            })
            .onEnded ({ _ in
                // DESABILITAR INCREMENTO
                isPressed = false
                audioPlayer?.pause()
                // parar o timer
            })
    }
    var button: some View {
        Image(systemName: "drop")
            .font(.system(size: 30))
            .foregroundColor(.blue)
            .padding(25)
            .background(.white, in: Circle())
            .gesture(onHoldGesture)
    }
}


struct PrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalView(name: "", plantName: "")
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

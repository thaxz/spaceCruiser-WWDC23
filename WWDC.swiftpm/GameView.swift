//
//  GameView.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import SwiftUI

struct GameView: View {
    
    let images = (0...3).map { UIImage(named: "spaceship_0\($0)")!}
    var backgroundImage: String
    var groundImage: String
    let level: GameLevels
    @EnvironmentObject var gameViewModel: GameViewModel
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.backgroundImage = "skyEarth"
            self.groundImage = "groundEarth"
        case .planet:
            self.backgroundImage = "skyMoon"
            self.groundImage = "groundMoon"
        }
    }
    
    var body: some View {
        ZStack {
            Color.theme.darkerPurple
            Image(backgroundImage)
                .resizable()
            ZStack(){
                VStack {
                    Spacer()
                    Image(groundImage)
                        .resizable()
                        .frame(height: 495)
                        .transformEffect(
                            withAnimation(.spring()){
                                gameViewModel.planetRotation
                            }
                        )
                }
                VStack{
                    Spacer()
                        .frame(height: 50)
                    TimeContainer(time: gameViewModel.secondsPlaying)
                    Spacer()
                    Image(uiImage: images[gameViewModel.index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .transformEffect(gameViewModel.playerRotation)
                    Spacer()
                    Spacer()
                }
            }
            
            if gameViewModel.showGameOver {
                GameOverView()
            }
            if gameViewModel.showWin {
                WinView()
            }
            if gameViewModel.showInstructions {
                VStack{
                    Spacer()
                        .frame(height: 50)
                    InstructionsBanner(timeNedeed: gameViewModel.secondsNeeded)
                    Spacer()
                }
            }
        }
        .onAppear{
            play("musicaTest")
        }
        .onChange(of: gameViewModel.showWin || gameViewModel.showGameOver, perform: { _ in
            player.pause()
        })
        .ignoresSafeArea()
    }
    
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}

//
//  CreditsView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

// MARK: Create Credits View

struct CreditsView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            GameGradient()
                .ignoresSafeArea()
            VStack(spacing: 20){
                
                Text("CREDITS")
                    .font(.system(size: 42, weight: .bold))
                    .foregroundColor(.white)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16){
                        CreditsSection(headerName: "Background Music", type: "Sound Effects", source: "Created using GarageBand", author: "Thais Monteiro (owner)")
                        
                        CreditsSection(headerName: "Close Icon", type: "Design", source: "https://www.flaticon.com/free-icon/close_1828665?term=close&page=1&position=16&origin=search&related_id=1828665", author: "Pixel Perfect")
                        
                        CreditsSection(headerName: "Earth Characteristics", type: "Information", source: "https://solarsystem.nasa.gov/planets/earth/overview/", author: "Nasa")
                        
                        CreditsSection(headerName: "Pixel Art Illustrations", type: "Design", source: "Created for the game", author: "Thais Monteiro (owner)")
                        
                        CreditsSection(headerName: "Mae Jemison Biography", type: "Information", source: "https://www.womenshistory.org/education-resources/biographies/mae-jemison", author: "Kerri Lee Alexander")
                        
                        CreditsSection(headerName: "Moon Characteristics", type: "Information", source: "https://solarsystem.nasa.gov/moons/earths-moon/overview/", author: "Nasa")
                        
                        CreditsSection(headerName: "Nancy Grace Biography", type: "Information", source: "https://solarsystem.nasa.gov/people/225/nancy-roman-1925-2018/", author: "Nasa")
                        
                        CreditsSection(headerName: "Tick Icon", type: "Design", source: "https://www.flaticon.com/free-icon/checkmark_8968523?term=tick&page=1&position=28&origin=tag&related_id=8968523", author: "Icon Wind")
                    }
                }
                PrimaryButton(action: {
                    gameViewModel.gameScene = .home
                }, name: "Main Menu")
            }
            .padding(16)
        }
    }
}


// Container that displays custom credits information
struct CreditsSection: View {
    let headerName: String
    let type: String
    let source: String
    let author: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.primaryColor.opacity(0.30))
                .overlay (
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.theme.terciaryColor, lineWidth: 2)
                )
            VStack(alignment: .leading, spacing: 8){
                    Text(headerName)
                        .font(.system(size: 22, weight: .semibold))
                HStack {
                    Text("Type:")
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(type)
                        .font(.system(size: 16, weight: .regular))
                }
                HStack {
                    Text("Source:")
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(source)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Author:")
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(author)
                        .font(.system(size: 16, weight: .regular))
                }
            }
            .padding(16)
            .foregroundColor(.white)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .environmentObject(dev.gameVM)
    }
}

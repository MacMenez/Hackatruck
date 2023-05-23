//
//  RandomMusic.swift
//  Aula 04 - 2023_05_22
//
//  Created by Student05 on 22/05/23.
//

import SwiftUI

struct RandomMusic: View {
    var musicaCLicada: Musica
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                AsyncImage(url: URL(string: "\(musicaCLicada.capa)")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .clipShape(Rectangle())
                            .frame(maxWidth: 200, maxHeight: 200)
                            .padding(.leading)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
                Text(musicaCLicada.nome)
                    .font(.title)
                    .foregroundColor(Color.white)
                Text(musicaCLicada.artista)
                    .font(.title3)
                    .foregroundColor(Color.white)
                
                
                HStack(spacing: 40){
                    Image(systemName: "shuffle").font(.title)
                        
                    Image(systemName: "backward.end.circle.fill").font(.title)
                    
                    Image(systemName: "play.circle.fill").font(.largeTitle)
                   
                    Image(systemName: "forward.end.circle.fill").font(.title)
                    Image(systemName: "repeat.circle.fill").font(.title)
                }.padding(.top).foregroundColor(Color.white)
            }
        }
    }
}
struct RandomMusic_Previews: PreviewProvider {
    static var previews: some View {
        RandomMusic(musicaCLicada: Musica(id: 9, nome: "Marry On A Cross", artista: "Gost", capa: "https://i.scdn.co/image/ab67616d0000b2733e03417574f87a0a708f8a2a"))
        //RandomMusic(musicaCLicada: Musica(id: 0, nome: "", artista: "", capa: ""))
    }
}

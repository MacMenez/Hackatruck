//
//  Music.swift
//  Aula 04 - 2023_05_22
//
//  Created by Student05 on 22/05/23.
//

import SwiftUI

struct Music: View {
  
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
        }
        
    }
}

struct Music_Previews: PreviewProvider {
    static var previews: some View {
        Music()
    }
}


struct Musica: Identifiable{
    var id: Int
    var nome: String
    var artista: String
    var capa: String
}
/*
TabView{
    Music()
        .tabItem{
            Label("Random", systemImage: "shuffle")
        }
    Music()
        .tabItem{
            Label("Previus", systemImage: "backward.end.circle.fill")
        }
    Music()
        .tabItem{
            Label("Play", systemImage: "play.circle.fill")
        }
    Music()
        .tabItem{
            Label("Next", systemImage: "forward.end.circle.fill")
        }
    Music()
        .tabItem{
            Label("Repeat", systemImage: "repeat.circle.fill")
        }
}
*/

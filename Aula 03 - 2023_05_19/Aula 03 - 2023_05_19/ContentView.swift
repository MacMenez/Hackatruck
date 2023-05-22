//
//  ContentView.swift
//  Aula 03 - 2023_05_19
//
//  Created by Student05 on 19/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(){
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }
            PhotoView()
                .tabItem {
                    Label("Photo", systemImage: "photo")
                }
            SearchView()
                .tabItem {
                    Label("Seach", systemImage: "magnifyingglass")
                }
            Messages()
                .badge(5)
                .tabItem {
                    Label("Messages", systemImage: "character.bubble.fill")
                }
            Futebol()
                .badge(!")
                .tabItem {
                    Label("Futebol", systemImage: "soccerball")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

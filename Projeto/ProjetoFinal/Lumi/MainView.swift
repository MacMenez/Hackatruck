//
//  MainView.swift
//  Lumi
//
//  Created by Student03 on 14/06/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Home()
                .tabItem{Label("Home", systemImage: "homekit")
                }
            ContentView()
                .tabItem{Label("Remédios", systemImage: "cross.vial")}
            AnaliseDePerfilView()
                .tabItem{Label("Analise de Perfil", systemImage: "person.circle.fill")}
            GraficoSaudeView()
                .tabItem{Label("Gráfico de Saúde", systemImage: "cross.fill")}


        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  ContentView.swift
//  testes
//
//  Created by Student05 on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var shouldPresentSheet = false
    
    var body: some View {
        VStack{
            NavigationStack{
                VStack{
                    Button("Grafico de Ponto"){
                        shouldPresentSheet.toggle()
                    }.sheet(isPresented: $shouldPresentSheet) {
                        print("Sheet dismissed!")
                    } content: {
                        testeGraficoPonto()
                    }
                    
                    Button("Grafico de Linha"){
                        shouldPresentSheet.toggle()
                    }.sheet(isPresented: $shouldPresentSheet) {
                        print("Sheet dismissed!")
                    } content: {
                        testeGraficoLinha()
                    }
                }
                
                VStack{
                    Image(systemName: "exclamationmark.triangle.fill")
                    Image(systemName: "plus.circle.fill")
                }
                
                TabView{
                    testeCalendario()
                        .tabItem {
                            Label("Calendario", systemImage: "calendar")
                        }
                    testeCalendario()
                        .tabItem {
                            Label("Perfil", systemImage: "chart.pie")
                        }
                    testeCalendario()
                        .tabItem {
                            Label("Principal", systemImage: "homekit")
                        }
                    testeCalendario()
                        .tabItem {
                            Label("Saude", systemImage: "heart.circle")
                        }
                    testeCalendario()
                        .tabItem {
                            Label("Home", systemImage: "homekit")
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

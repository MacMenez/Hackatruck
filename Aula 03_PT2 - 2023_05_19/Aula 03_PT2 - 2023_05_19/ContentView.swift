//
//  ContentView.swift
//  Aula 03_PT2 - 2023_05_19
//
//  Created by Student05 on 19/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var shouldPresentSheet = false
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: Modo1()){
                    Text("Modo 1")
                }
                
                NavigationLink(destination: Modo2()){
                    Text("Modo 2")
                }
                
                Button("Modo 3"){
                    shouldPresentSheet.toggle()
                }.sheet(isPresented: $shouldPresentSheet) {
                    print("Sheet dismissed!")
                } content: {
                    Modo3()
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

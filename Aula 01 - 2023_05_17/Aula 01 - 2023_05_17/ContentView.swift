//
//  ContentView.swift
//  Aula 01 - 2023_05_17
//
//  Created by Student05 on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("bg")
            
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
            Text("Hackatruck").foregroundColor(.blue)
            HStack{Text("Maker").foregroundColor(.yellow)
                Text("Space").foregroundColor(.red)
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

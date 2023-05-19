//
//  Desafio2.swift
//  Aula 01 - 2023_05_17
//
//  Created by Student05 on 17/05/23.
//

//
//  ContentView.swift
//  Aula 01 - 2023_05_17
//
//  Created by Student05 on 17/05/23.
//

import SwiftUI

struct Desafio2: View {
    var body: some View {
        VStack{
            Spacer()
            Image("bg")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .offset(y: -60)
            Spacer()
            Image("bg")
                .resizable()
                .padding(0.0)
                .scaledToFit()
                .foregroundColor(.accentColor)
                .clipShape(Circle())
                .offset(y: -50)
                .overlay(Text("Hackatruck").font(.largeTitle).fontWeight(.bold).foregroundColor(.blue).padding(.bottom, 250.0)
                )
            Spacer()
            HStack{
                Text("Maker").foregroundColor(.yellow).multilineTextAlignment(.center)
                Text("Space").foregroundColor(.red)
            }.padding(.all, 50).background(Color(.black))
        }
    }
}

struct Desafio2_Previews: PreviewProvider {
    static var previews: some View {
        Desafio2()
    }
}

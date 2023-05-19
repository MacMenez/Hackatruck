//
//  Desafio3.swift
//  Aula 01 - 2023_05_17
//
//  Created by Student05 on 17/05/23.
//
import SwiftUI

struct Desafio3: View {

@State private var userName: String = ""
    
    var body: some View {
        ZStack{
            Image("bg").resizable().opacity(0.2)
            HStack{
                Text("Bem Vindo \(userName) !")
            }
            
            TextField("", text: $userName).multilineTextAlignment(.center)
            
            Spacer()
            
            VStack{
                Image("logo").resizable().scaledToFit().frame(width: 200, height: 100)
                Image("truck").resizable().frame(width: 100)
            }
        }
        .padding()
    }
}

struct Desafio3_Previews: PreviewProvider {
    static var previews: some View {
        Desafio3()
    }
}

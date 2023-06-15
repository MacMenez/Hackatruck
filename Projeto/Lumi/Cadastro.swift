//
//  Cadastro.swift
//  Lumi
//
//  Created by Student03 on 14/06/23.
//

import SwiftUI

struct Cadastro: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack{
            FundoCadastro()
            VStack {
                TextField("Nome de usuário", text: $username)
                    .padding()
                    .border(Color.gray)
                SecureField("Senha", text: $password)
                    .padding()
                    .border(Color.gray)
                Button(action: {
                    // Implementar função para cadastrar usuário
                }) {
                    Text("Cadastrar")
                }
            }
        }
        .padding()
    }
}

struct Cadastro_Previews: PreviewProvider {
    static var previews: some View {
        Cadastro()
    }
}

struct FundoCadastro: View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 222 / 255, green: 142 / 255, blue: 178 / 255))
            .scaledToFill()
        Circle()
            .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
            .offset(x:-100,y:-300)
            .frame(width: 300)
        Circle()
            .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
            .offset(x:150,y:-350)
            .frame(width: 200)
        Circle()
            .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
            .offset(x:150,y:299)
            .frame(width: 450)
        Circle()
            .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
            .offset(x:-50,y:399)
            .frame(width: 300)
        Circle()
            .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
            .offset(x:-140,y:100)
            .frame(width: 99)
        Circle()
            .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
            .offset(x:-70,y:70)
            .frame(width:150)
    }
}


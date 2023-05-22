//
//  Modo2.swift
//  Aula 03_PT2 - 2023_05_19
//
//  Created by Student05 on 19/05/23.
//

import SwiftUI

struct Modo2: View {
    @State var nomeDigitado = ""
    var body: some View {
        VStack{
            TextField("Digite seu nome", text: $nomeDigitado)
            Text("Estamos percorrendo um caminho \(nomeDigitado)")
            
            NavigationLink(destination: Modo2p2(nomeDigitado: nomeDigitado)){
                Text("Ir Para Próxima Tela")
            }
        }
    }
}

struct Modo2_Previews: PreviewProvider {
    static var previews: some View {
        Modo2()
    }
}

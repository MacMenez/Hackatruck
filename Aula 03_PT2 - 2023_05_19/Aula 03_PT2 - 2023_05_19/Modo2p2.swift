//
//  Modo2p2.swift
//  Aula 03_PT2 - 2023_05_19
//
//  Created by Student05 on 19/05/23.
//

import SwiftUI

struct Modo2p2: View {
    
    var nomeDigitado : String
    var body: some View {
        Text("Volte \(nomeDigitado)!")
    }
}

struct Modo2p2_Previews: PreviewProvider {
    static var previews: some View {
        Modo2p2(nomeDigitado: "")
    }
}

//
//  Modo3.swift
//  Aula 03_PT2 - 2023_05_19
//
//  Created by Student05 on 19/05/23.
//

import SwiftUI

struct Modo3: View {
    @State private var mostrarSheet = false
    var body: some View {
        Button("SheetView"){
            mostrarSheet.toggle()
        }.sheet(isPresented: $mostrarSheet){Modo1()}
    }
}

struct Modo3_Previews: PreviewProvider {
    static var previews: some View {
        Modo3()
    }
}

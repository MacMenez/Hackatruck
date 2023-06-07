//
//  testeGraficoLinha.swift
//  testes
//
//  Created by Student05 on 24/05/23.
//

import SwiftUI
import Charts

struct testeGraficoLinha: View {
    var body: some View {
        Chart {
            ForEach(data) { shape in
                LineMark(
                    x: .value("Shape Type", shape.type),
                    y: .value("Total Count", shape.count)
                )
            }
        }
    }
}

struct testeGraficoLinha_Previews: PreviewProvider {
    static var previews: some View {
        testeGraficoLinha()
    }
}

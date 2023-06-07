//
//  testeGraficoPonto.swift
//  testes
//
//  Created by Student05 on 24/05/23.
//

import SwiftUI
import Charts

struct testeGraficoPonto: View {
    var body: some View {
        Chart {
            PointMark(
                x: .value("Shape Type", data[0].type),
                y: .value("Total Count", data[0].count)
            )
            PointMark(
                 x: .value("Shape Type", data[1].type),
                 y: .value("Total Count", data[1].count)
            )
            PointMark(
                 x: .value("Shape Type", data[2].type),
                 y: .value("Total Count", data[2].count)
            )
        }
    }
}

struct testeGraficoPonto_Previews: PreviewProvider {
    static var previews: some View {
        testeGraficoPonto()
    }
}

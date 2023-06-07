//
//  testeGraficoBarra.swift
//  testes
//
//  Created by Student05 on 24/05/23.
//

import SwiftUI
import Charts

struct testeGraficoBarra: View {
    var body: some View {
        Chart {
            BarMark(
                x: .value("Shape Type", data[0].type),
                y: .value("Total Count", data[0].count)
            )
            BarMark(
                 x: .value("Shape Type", data[1].type),
                 y: .value("Total Count", data[1].count)
            )
            BarMark(
                 x: .value("Shape Type", data[2].type),
                 y: .value("Total Count", data[2].count)
            )
        }
    }
}

struct testeGraficoBarra_Previews: PreviewProvider {
    static var previews: some View {
        testeGraficoBarra()
    }
}

//
//  ContentView.swift
//  grafico
//
//  Created by Student07 on 15/06/23.
//

import SwiftUI
import Charts


struct DayInfo: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
    var type: String
}

struct ContentView: View {
    let data: [DayInfo] = [
        DayInfo(mount: "dom", value: 53,type: "bpm"),
        DayInfo(mount: "seg", value: 50,type: "bpm"),
        DayInfo(mount: "ter", value: 57,type: "bpm"),
        DayInfo(mount: "qua", value: 65,type: "bpm"),
        DayInfo(mount: "qui", value: 54,type: "bpm"),
        DayInfo(mount: "sex", value: 60,type: "bpm"),
        DayInfo(mount: "sab", value: 52,type: "bpm"),
        
        DayInfo(mount: "dom", value: 120,type: "pressão"),
        DayInfo(mount: "seg", value: 122,type: "pressão"),
        DayInfo(mount: "ter", value: 115,type: "pressão"),
        DayInfo(mount: "qua", value: 130,type: "pressão"),
        DayInfo(mount: "qui", value: 135,type: "pressão"),
        DayInfo(mount: "sex", value: 127,type: "pressão"),
        DayInfo(mount: "sab", value: 129,type: "pressão")
        ]
            
        var body: some View {
           
            
            List {
                        Chart {
                            ForEach(data) {
                                LineMark(
                                    x: .value("Mount", $0.mount),
                                    y: .value("Value", $0.value)
                                )
                                .foregroundStyle(by: .value("Type", "média/dia: \($0.type)"))
                                PointMark(
                                    x: .value("Mount", $0.mount),
                                    y: .value("Value", $0.value)
                                
                                )
                                .foregroundStyle(by: .value("Type", "média/dia: \($0.type)"))
                            }
                        }
                        .frame(height: 250)
                    }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

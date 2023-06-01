//
//  ContentView.swift
//  calendario
//
//  Created by Student05 on 01/06/23.
//

import SwiftUI

struct ContentView: View {
    let daysOfWeek = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"]
    let markedDays: [Int] = [1, 2, 3, 6] // Dias marcados: Seg, Ter, Qua, Sáb
    
    var body: some View {
        VStack {
            Text("Calendário Semanal")
                .font(.title)
                .padding()
            
            HStack(spacing: 10) {
                ForEach(0..<daysOfWeek.count) { index in
                    VStack {
                        Text(daysOfWeek[index])
                            .font(.headline)
                        
                        if markedDays.contains(index) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        } else if index == 4 {
                            Circle()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.orange)
                        } else {
                            Image(systemName: "xmark")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

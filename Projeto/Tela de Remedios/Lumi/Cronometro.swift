//
//  Cronometro.swift
//  Lumi
//
//  Created by Student05 on 13/06/23.
//

import SwiftUI

struct Cronometro: View {
    
    //Buscar elementos da API
    @StateObject var a = LumiModel()
    
    //Criando uma variavel para tratar os dados da API
    var remedio: CountdownItem
    
    var body: some View {
        ForEach(a.items) { item in
            CountdownItemView(item: item)
        }
    }
}

struct CountdownItemView: View {
    @State private var isAlertPresented = false //Controlar a exibição de um alerta quando o tempo se esgota
    @ObservedObject var item: CountdownItem
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(.headline)
            
            Text(item.timeString)
                .font(.title)
                .padding(.bottom, 20)
                .onAppear {
                    item.startCountdown { didPerformAction in
                        if didPerformAction {
                            DispatchQueue.main.async {
                                item.reset()
                            }
                        } else {
                            isAlertPresented = true
                        }
                    }
                }
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(title: Text("Alerta"), message: Text("Tempo encerrado sem ação realizada."), dismissButton: .default(Text("OK")))
        }
    }
}

class CountdownItem: ObservableObject, Identifiable {
    let id = UUID()
    let name: String
    let duration: TimeInterval
    let action: () -> Void
    var timer : Timer
    
    //Tempo restante em segundos (remainingTime)
    @Published private var remainingTime: TimeInterval = 0
    var timeString: String {
        let hours = Int(remainingTime) / 3600
        let minutes = (Int(remainingTime) % 3600) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    init(name: String, duration: TimeInterval, action: @escaping () -> Void) {
        self.name = name
        self.duration = duration
        self.action = action
        self.timer = Timer()
    }
    
    //Iniciar a contagem regressiva
    func startCountdown(completion: @escaping (Bool) -> Void) {
        remainingTime = duration
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            [weak self] _ in guard let self = self else {
                return
            }
            
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.timer.invalidate()
                self.action()
                completion(true)
            }
        }
        
        timer.fire()
    }
    //Reiniciar o cronômetro.
    func reset() {
        remainingTime = duration
    }
}

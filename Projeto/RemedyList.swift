//CÓDIGO PARA GERAR A LISTA DE REMÉDIOS E FAZER A CONTAGEM REGRESSIVA PARA CADA REMÉDIO
import SwiftUI

struct ContentView: View {
    //Representa um item da lista
    @State private var items: [CountdownItem] = [
        CountdownItem(name: "Tarefa 1", duration: 10, action: { print("Ação realizada para Tarefa 1!") }),
        CountdownItem(name: "Tarefa 2", duration: 20, action: { print("Ação realizada para Tarefa 2!") }),
        CountdownItem(name: "Tarefa 3", duration: 15, action: { print("Ação realizada para Tarefa 3!") })
    ]
    
    var body: some View {
        List(items) { item in
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
    }
    
    //Iniciar a contagem regressiva
    func startCountdown(completion: @escaping (Bool) -> Void) {
        remainingTime = duration
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else {
                return
            }
            
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                timer.invalidate()
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

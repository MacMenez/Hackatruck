import SwiftUI

struct SwiftUIView: View {
    
    @State private var nome = ""
    @State private var tempoDeCiclo = ""
    @State private var quantidadePorCartela = ""
    @State private var quantidadeDeCartelas = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var hasTimeElapsed = false
    
    private func delayText() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 2_500_000_000)
            hasTimeElapsed = true
        }
    
    func cadastrarRemedio() {
        guard let url = URL(string: "http://192.168.128.237:1880/postRemedios") else {
            print("URL inválida")
            return
        }
        
        guard let tempoDeCicloInt = Int(tempoDeCiclo) else {
            print("Tempo de ciclo inválido")
            return
        }
        
        guard let quantidadePorCartelaInt = Int(quantidadePorCartela),
              let quantidadeDeCartelasInt = Int(quantidadeDeCartelas) else {
            print("Valores de quantidade inválidos")
            return
        }
        
        let tempoDeCicloEmSegundos = tempoDeCicloInt * 3600
        let quantidadeTotal = quantidadePorCartelaInt * quantidadeDeCartelasInt
        
        let remedio = [
            "nome": nome,
            "tempoDeCiclo": tempoDeCicloEmSegundos,
            "quantidadePorCartela": quantidadePorCartelaInt,
            "quantidadeDeCartelas": quantidadeDeCartelasInt,
            "quantidadeTotal": quantidadeTotal
        ] as [String : Any]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: remedio, options: [])
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("Erro ao enviar requisição: \(error.localizedDescription)")
                        self.alertMessage = "Falha ao cadastrar o remédio"
                    } else {
                        print("Remédio cadastrado com sucesso")
                        self.alertMessage = "Remédio cadastrado com sucesso"
                    }
                    self.showAlert = true
                }
            }
            
            task.resume()
        } catch {
            print("Erro ao converter dados em JSON: \(error.localizedDescription)")
        }
    }
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form {
            Section(header: Text("Informações do Remédio")) {
                TextField("Nome do remédio", text: $nome)
                    .autocorrectionDisabled(true)
                TextField("Tempo de ciclo (em horas)", text: $tempoDeCiclo)
                    .keyboardType(.numberPad)
                TextField("Quantidade de remédios por cartela", text: $quantidadePorCartela)
                    .keyboardType(.numberPad)
                TextField("Quantidade de cartelas", text: $quantidadeDeCartelas)
                    .keyboardType(.numberPad)
            }
            
            Button("Cadastrar Remédio") {
                cadastrarRemedio()
                dismiss()
            }
            .disabled(nome.isEmpty || tempoDeCiclo.isEmpty || quantidadePorCartela.isEmpty || quantidadeDeCartelas.isEmpty)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

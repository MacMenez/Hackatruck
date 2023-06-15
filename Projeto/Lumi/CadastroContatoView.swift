//
//  CadastrarContato.swift
//  AnaliseDePerfil
//
//  Created by Student07 on 14/06/23.
//

import SwiftUI
import iPhoneNumberField

struct CadastroContatoView: View {
    @State private var nome = ""
    @State private var parentesco = ""
    @State private var telefone = ""
    //@State private var quantidadeDeCartelas = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    func cadastrarContato() {
        guard let url = URL(string: "http://127.0.0.1:1880/postContato") else {
            print("URL inválida")
            return
        }
        
      
        
        //let tempoDeCicloEmSegundos = tempoDeCicloInt * 3600
        //let quantidadeTotal = quantidadePorCartelaInt * quantidadeDeCartelasInt
        
        let contato = [
            "nome": nome,
            "parentesco": parentesco,
            "telefone": telefone,
            
        ] as [String : Any]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: contato, options: [])
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("Erro ao enviar requisição: \(error.localizedDescription)")
                        self.alertMessage = "Falha ao cadastrar contato"
                    } else {
                        print("Contato cadastrado com sucesso")
                        self.alertMessage = "Contato cadastrado com sucesso"
                    }
                    self.showAlert = true
                }
            }
            
            task.resume()
        } catch {
            print("Erro ao converter dados em JSON: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        Form {
            Section(header: Text("Informações do Contato")) {
                TextField("Nome ", text: $nome)
                    .autocorrectionDisabled(true)
                TextField("Parentesco", text: $parentesco)
                    .autocorrectionDisabled(true)
                iPhoneNumberField("Telefone", text: $telefone).flagHidden(false)
                    .flagSelectable(true)
            }
            
            Button("Salvar Contato") {
                cadastrarContato()
            }
            //.disabled(nome.isEmpty || tempoDeCiclo.isEmpty || quantidadePorCartela.isEmpty || quantidadeDeCartelas.isEmpty)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct CadastroContatoView_Previews: PreviewProvider {
    static var previews: some View {
        CadastroContatoView()
    }
}

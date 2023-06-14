//
//  LumiModel.swift
//  Lumi
//
//  Created by Student05 on 13/06/23.
//

import Foundation

struct remedio: Codable, Identifiable{
    let _id: String //ID gerado aleatoriamente na Nuvem
    let _rev: String // Referencia na Nuvem
    let quantidadeTotal: Int // Quantidade de remedios no estoque (quantidadePorCartela * quantidadeDeCartelas)
    let nome: String // Nome do Remedio
    let tempoDeCiclo: Int // Quanto em quanto tempo tem que tomar o remedio
    let quantidadePorCartela: Int //Quantidade de remedios que estao na cartela
    let quantidadeDeCartelas: Int //Quantidade de cartelas na caixa do remedio
}

class LumiModel : ObservableObject {
    @Published var items: [remedio] = [
//        TESTE COM VALORES LOCAL
//        CountdownItem(name: "Tarefa 1", duration: 1000, action: { print("Ação realizada para Tarefa 1!") }),
//        CountdownItem(name: "Tarefa 2", duration: 2000, action: { print("Ação realizada para Tarefa 2!") }),
//        CountdownItem(name: "Tarefa 3", duration: 1500, action: { print("Ação realizada para Tarefa 3!") })
    ]
    
    func fetch(){
        guard let url = URL(string: "") //URL da API que conterá os dados da Lista de remedios com suas especificacoes
        else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            [weak self] data,
            _,
            error in guard let data = data,
                           error == nil else{
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([remedio].self, from: data)
                
                DispatchQueue.main.async {
                    self?.items = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
}

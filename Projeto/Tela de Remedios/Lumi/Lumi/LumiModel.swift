//
//  LumiModel.swift
//  Lumi
//
//  Created by Student05 on 13/06/23.
//

import Foundation

struct remedio: Codable, Identifiable{
    let id: String
    let name: String
    let duration: Int
}

class LumiModel : ObservableObject {
    @Published var items: [remedio] = [
//        CountdownItem(name: "Tarefa 1", duration: 1000, action: { print("Ação realizada para Tarefa 1!") }),
//        CountdownItem(name: "Tarefa 2", duration: 2000, action: { print("Ação realizada para Tarefa 2!") }),
//        CountdownItem(name: "Tarefa 3", duration: 1500, action: { print("Ação realizada para Tarefa 3!") })
    ]
    
    func fetch(){
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor")
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

//
//  ModelCadastroContato.swift
//  Lumi
//
//  Created by Student03 on 15/06/23.
//

import Foundation

class ModelCadastroContato : ObservableObject {
    
    @Published var chars : [Contato] = []
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.237:1880/getContato") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Contato].self, from: data)
                
                
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

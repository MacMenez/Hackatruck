//
//  viewModel.swift
//  Aula 12 - 2023_06_05
//
//  Created by Student05 on 05/06/23.
//

import Foundation
struct lituraUmidade: Codable{
    //? -> Valor opcional, se nao houver um valor, preenche com NULL
    let _id: String?
    let _rev: String?
    let umidade: String?
}

struct Wand: Codable{
    //? -> Valor opcional, se nao houver um valor, preenche com NULL
    let wood: String?
    let core: String?
    let length: Double?
}

struct HaPo: Codable, Identifiable{
    let id: String
    let name: String?
    let alternate_names: [String?]
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: Wand
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternate_actor: String?
    let alive: Bool?
    let image: String?
}

class ViewModel: ObservableObject{
    @Published var chars : [lituraUmidade] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/listar")
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
                let parsed = try JSONDecoder().decode([lituraUmidade].self, from: data)
                
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


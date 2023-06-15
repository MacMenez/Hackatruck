//
//  contatos.swift
//  AnaliseDePerfil
//
//  Created by Student07 on 13/06/23.
//

import Foundation

struct Contato :Codable, Identifiable
{
    let id: String? = UUID().uuidString
    var nome: String
    var parentesco: String
    var telefone: String
 
}



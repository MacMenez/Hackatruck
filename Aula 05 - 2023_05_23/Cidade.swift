//
//  Cidade.swift
//  Aula 05 - 2023_05_23
//
//  Created by Student05 on 23/05/23.
//

import SwiftUI
import CoreLocation

struct Cidade: View {
    var telaClicada: Localizacao
    var body: some View {
        VStack{
            Text("\(telaClicada.nome)")
                .font(.title)
                .fontWeight(.bold)
            AsyncImage(url: URL(string: "\(telaClicada.flag)")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .clipShape(Rectangle())
                        .frame(maxWidth: 300, maxHeight: 200)
                        .padding(.leading)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            Text("\(telaClicada.descricao)")
        }
    }
}

struct Cidade_Previews: PreviewProvider {
    static var previews: some View {
        Cidade(telaClicada: Localizacao(nome: "", coordenada: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), flag: "", descricao: ""))
    }
}

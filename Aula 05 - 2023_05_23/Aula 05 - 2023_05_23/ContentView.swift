//
//  ContentView.swift
//  Aula 05 - 2023_05_23
//
//  Created by Student05 on 23/05/23.
//

import SwiftUI
import MapKit
import Foundation

extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}

struct Localizacao: Identifiable{
    let id = UUID()
    let nome: String
    let coordenada: CLLocationCoordinate2D
    let flag: String
    let descricao: String
}

var vetorCidade = [
    Localizacao(nome: "Camberra",
                coordenada: CLLocationCoordinate2D(latitude: -35.281934, longitude: 149.120024),
                flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Australia.svg/80px-Flag_of_Australia.svg.png",
                descricao: "Camberra é a capital da Austrália. Com uma população de 450 mil habitantes, é a oitava cidade mais populosa do país. A cidade está localizada no extremo norte do Território da Capital Australiana, a 280 km a sudoeste de Sydney e a 660 km a nordeste de Melbourne."),
    
    Localizacao(nome: "Toronto",
                coordenada: CLLocationCoordinate2D(latitude: 43.68599561286166, longitude: -79.39734139623108),
                flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Flag_of_Toronto%2C_Canada.svg/200px-Flag_of_Toronto%2C_Canada.svg.png",
                descricao: "Toronto, a capital da província de Ontário, é uma grande cidade canadense localizada ao longo da costa noroeste do Lago Ontário. Ela é uma metrópole dinâmica com um centro de arranha-céus imponentes, todos ofuscados pela famosa Torre CN. Toronto também tem muitos espaços verdes, incluindo desde o oval Queen’s Park até o High Park, com 400 acres de área, além de trilhas, instalações esportivas e um jardim zoológico."),
    
    Localizacao(nome: "Nara",
                coordenada: CLLocationCoordinate2D(latitude: 34.53635497832969, longitude: 135.9073389780782),
                flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Flag_of_Nara%2C_Nara.svg/200px-Flag_of_Nara%2C_Nara.svg.png",
                descricao: "Nara é a capital da prefeitura japonesa de Nara, na região central de Honshu. A cidade tem templos e artes que remetem ao século 8, quando era a capital do Japão. Animais rugem no parque Nara, local do templo Tōdai-ji. Daibutsu, o Buda em bronze de 15 m de Tōdai-ji, é exposto em um grande salão de madeira. No lado leste do parque está o santuário Shinto Kasuga Taisha, que data de 768 D.C. com mais de 3.000 lanternas.")
]

struct ContentView: View {
    
    @State private var regiaoMapa = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    @State var localizacaoAtual = "Brasil"
    
    @State var mudarTela = false
    
    var body: some View {
        VStack {
            Text("World Map")
                .font(.title)
                .fontWeight(.bold)
            Text("\(localizacaoAtual)")
            
            Map(coordinateRegion: $regiaoMapa, annotationItems: vetorCidade){ location in
                MapAnnotation(coordinate: location.coordenada){
                    Circle().foregroundColor(.red).frame(width: 44, height: 44).onTapGesture {
                        mudarTela.toggle()
                    }.sheet(isPresented: $mudarTela){
                        Cidade(telaClicada: location)
                    }
                }
            }
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(vetorCidade) { localizacao in
                        Button("\(localizacao.nome)"){
                            regiaoMapa = MKCoordinateRegion(center: localizacao.coordenada, span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
                            localizacaoAtual = localizacao.nome
                        }.padding(.horizontal).buttonStyle(.borderedProminent)
                    }
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 Map(coordinateRegion: $regiaoMapa, annotationItems: vetorCidade){ vetorCidade in MapAnnotation(coordinate: vetorCidade.coordenada){
 Circle().onTapGesture {
 mudarTela.toggle()
 }.sheet(isPresented: $mudarTela){Localizacao(descricao: vetorCidade)}
 }
 */

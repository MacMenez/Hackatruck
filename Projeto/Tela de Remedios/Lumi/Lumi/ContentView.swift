//
//  ContentView.swift
//  Lumi
//
//  Created by Student03 on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    
    //INFORMACOES DO AVATAR
    @State var isConnected = false
    @State var userName = "Agenor Fulano"
    @State private var showingSheet = false
    
    //INFORMACOES PARA CALENDARIO
    let daysOfWeek = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"]
    let markedDays: [Int] = [1, 2, 3, 6]
    
    var body: some View {
        VStack {
            ScrollView{
                HStack{
                    VStack{
                        Image(systemName: "person.circle.fill").font(.system(size: 100))
                        Text(userName)
                    }
                    Spacer()
                    VStack{
                        if isConnected == true{
                            Image(systemName: "shippingbox").font(.system(size: 100)).foregroundColor(.green)
                            Text("Lumibox \n Conectada")
                        }
                        else{
                            Image(systemName: "shippingbox").font(.system(size: 97)).foregroundColor(.red)
                            Text("\tLumibox \t Desconectada")
                        }
                    }
                }.padding(.horizontal)
                Rectangle().cornerRadius(25)
                    .frame(height: 300)
                    .foregroundColor(Color("roxinho")).opacity(0.50)
                    .overlay(
                        ScrollView{
                            VStack{
                                //CHAMADA DAS INFORMACOES DE OUTRA TELA (TELA TESTE)
                               Cronometro()
                            }
                        }
                    )
                    .shadow(color: Color("roxinho"), radius: 5, x: 10, y: 10)
                    .padding(.vertical)
                Rectangle().cornerRadius(25)
                    .frame(height: 100)
                    .foregroundColor(Color("amarelinho2")).opacity(0.50).overlay(
                        VStack{
                            Text("Calendário da Semana").font(.title).padding(.vertical, -3.0)
                            HStack(spacing: 10) {
                                ForEach(0..<daysOfWeek.count) { index in
                                    VStack {
                                        Text(daysOfWeek[index])
                                            .font(.headline)
                                        
                                        if markedDays.contains(index) {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.green)
                                        } else if index == 4 {
                                            Image(systemName: "circle")
                                                .foregroundColor(.orange)
                                        } else {
                                            Image(systemName: "xmark")
                                                .foregroundColor(.red)
                                        }
                                    }
                                }
                            }
                        }
                    )
                    .shadow(color: Color("amarelinho2"), radius: 5, x: 10, y: 10)
                Button("Cadastrar Remédio") {
                    showingSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .sheet(isPresented: $showingSheet) {
                            SwiftUIView()
                        }
                .padding()
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




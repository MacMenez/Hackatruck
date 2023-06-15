//
//  ContentView.swift
//  Lumi
//
//  Created by Student03 on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    
    //INFORMACOES DO AVATAR
    @State var isConnected = true
    @State var userName = "Agenor Fulano"
    @State private var showingSheet = false
    @StateObject var viewmodel = LumiModel()
    
    //INFORMACOES PARA CALENDARIO
    let daysOfWeek = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"]
    let markedDays: [Int] = [1, 2, 3, 6]
    
    var body: some View {
        ZStack{
            Fundo()
                ScrollView{
                    VStack {
                    HStack{
                        VStack{
                            Image(systemName: "person.circle.fill").font(.system(size: 100))
                                .foregroundColor(Color(red: 104/255, green: 58/255, blue: 104/255))
                            Text(userName)
                                .foregroundColor(.white)
                        }.padding(.horizontal)
                        VStack{
                            if isConnected == true{
                                Image(systemName: "shippingbox").font(.system(size: 97))
                                    .foregroundColor(Color(red: 181/255, green: 255/255, blue: 148/255))
                                Text("Lumibox\n Conectada")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                            else{
                                Image(systemName: "shippingbox").font(.system(size: 97)).foregroundColor(.red)
                                Text("Lumibox\n Desconectada")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    Rectangle().cornerRadius(25)
                            .frame(width: 350,height: 300)
                        .foregroundColor(Color(red: 104/255, green: 58/255, blue: 104/255)).opacity(1)
                        .overlay(
                            ScrollView{
                                VStack{
                                //CHAMADA DAS INFORMACOES DA LISTA DE REMEDIOS NA LISTA DE INFORMACOES DO REMEDIO
                                    
                                    ForEach(viewmodel.items, id: \.self){
                                        rem in
                                        
                                        var c = CountdownItem(name: rem.nome, duration: Double(rem.tempoDeCiclo!), action: { print("teste") })
                                        
                                        CountdownItemView(item: c).foregroundColor(.white)
                                    
                                    }
                                }
                            }
                        )
                        .shadow(color: Color("roxinho"), radius: 5)
                        .padding(.vertical)
                    Rectangle().cornerRadius(25)
                            .frame(width:350 ,height: 100)
                        .foregroundColor(Color("amarelinho2")).opacity(1).overlay(
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
                        .shadow(color: Color("amarelinho2"), radius: 5)
                    Button("Cadastrar Remédio") {
                        showingSheet.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .tint(Color(red: 104/255, green: 58/255, blue: 104/255))
                    .sheet(isPresented: $showingSheet) {
                                SwiftUIView()
                            }
                    .padding()
                    
                }
            }
            .padding()
        }.onAppear(){
            viewmodel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackGroundTelaRemedio: View{
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 242 / 255, green: 246 / 255, blue: 178 / 255))
            //.frame(height: 900)
                .scaledToFill()
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:-100,y:-300)
                .frame(width: 300)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:140,y:-350)
                .frame(width: 200)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:150,y:299)
                .frame(width: 450)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:-50,y:399)
                .frame(width: 300)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:-140,y:100)
                .frame(width: 99)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:-70,y:70)
                .frame(width:150)
        }
        
    }
}

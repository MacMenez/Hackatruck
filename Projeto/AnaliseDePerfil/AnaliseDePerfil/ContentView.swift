//
//  ContentView.swift
//  AnaliseDePerfil
//
//  Created by Student07 on 13/06/23.
//

import SwiftUI

struct ContentView: View {
    
    let contatos=[
    Contato(id: 1, nome: "Manuel", parentesco: "Filho", telefone: "12345678", foto: ""),
    Contato(id: 2, nome: "Maria", parentesco: "Filha", telefone: "12345678", foto: ""),
    Contato(id: 3, nome: "Manuel", parentesco: "Filho", telefone: "12345678", foto: ""),
    Contato(id: 4, nome: "Maria", parentesco: "Filha", telefone: "12345678", foto: ""),
    Contato(id: 5, nome: "Manuel", parentesco: "Filho", telefone: "12345678", foto: ""),
    Contato(id: 6, nome: "Maria", parentesco: "Filha", telefone: "12345678", foto: ""),
    Contato(id: 7, nome: "Manuel", parentesco: "Filho", telefone: "12345678", foto: ""),
    Contato(id: 8, nome: "Maria", parentesco: "Filha", telefone: "12345678", foto: "")
    ]
    var body: some View {
        
        ZStack
        {
            
                
            BackGoundTela02()
            ScrollView(showsIndicators: false){
                VStack
                {
                    //Spacer()
                      //  .frame(height: 90)
                    //ANALISE DE PERFIL
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color(red: 159 / 255, green: 98 / 255, blue: 164 / 255))
                            .frame(width: 300, height: 70)
                        
                            .shadow(radius: 5)
                        Text("Análise de Perfil")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .shadow(radius: 5)
                        
                    }
                    
                    //GRAFICO
                    Circle()
                        .fill(Color(red: 187 / 255, green: 146 / 255, blue: 196 / 255))
                        .frame(width: 250)
                    
                        .shadow(radius: 5)
                    
                    //CONTATOS
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color(red: 212 / 255, green: 120 / 255, blue: 163 / 255))
                            .frame(width: 300, height: 280)
                        
                            .shadow(radius: 5)
                        
                        VStack
                        {
                            
                            Text("Contatos Responsáveis :")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .shadow(radius: 5)
                            
                            ScrollView
                            {
                                ForEach(contatos) { contato in
                                    /*@START_MENU_TOKEN@*/Text(contato.nome)
                                        .foregroundColor(Color.white)/*@END_MENU_TOKEN@*/
                                    Spacer()
                                }
                            }
                            .frame(width: 300,height: 210)
                        }
                        
                    }
                    Button("Adicionar Contato") {
                                        
                                    }
                                    .buttonStyle(.borderedProminent)
                                    .controlSize(.large)
                                    .shadow(radius: 5)
                                    .tint(Color(red: 212 / 255, green: 120 / 255, blue: 163 / 255))
                                    
                    Spacer()
                }
            }//.frame(height: 900)
            
            
        }
    }
}

struct BackGoundTela02: View{
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

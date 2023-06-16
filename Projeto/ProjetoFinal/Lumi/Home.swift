//
//  Home.swift
//  Lumi
//
//  Created by Student03 on 13/06/23.
//

import SwiftUI
import Charts

struct Home: View {
    let daysOfWeek = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"]
    let markedDays: [Int] = [1, 2, 3, 6]
    var body: some View {
        ZStack{
            Fundo()
            ScrollView{
                VStack{
                    GraficoSaude()
                        .cornerRadius(25)
                        .frame(width: 350, height: 300)
                        .shadow(radius: 5)
                        Text("Gráfico de Saúde")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                                Rectangle()
                                    .cornerRadius(25)
                                    .frame(width:350 ,height: 400)
                                    .padding(.horizontal)
                                    .foregroundColor(Color(red: 104/255, green: 58/255, blue: 104/255))
                                    .shadow(radius: 5)
                                    .overlay(
                                            
                                            VStack{
                                                Button(action: {
                                                    print("ALERTA")
                                                }) {
                                                    HStack {
                                                        Image(systemName: "exclamationmark.triangle.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 50))
                                                        Text("ALERTA H:M:S")
                                                            .font(.largeTitle)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                                .frame(width: 325.0, height: 80)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 219/255, green: 66/255, blue: 70/255)))
                                                .padding()
                                                VStack{
                                                    Text("Calendário da Semana")
                                                        .foregroundColor(.black)
                                                        .font(.title).padding(.vertical, -3.0)
                                                    HStack(spacing: 10) {
                                                        ForEach(0..<daysOfWeek.count) { index in
                                                            VStack {
                                                                Text(daysOfWeek[index])
                                                                    .font(.headline)
                                                                    .foregroundColor(.black)
                                                                
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
                                                }.padding(.horizontal, 30.0)
                                                    .padding(.vertical)
                                                    .background(Color("amarelinho2"))
                                            .cornerRadius(25)
                                                    //calendario
                                                HStack{
                                                    Image(systemName: "person.circle.fill").font(.system(size: 100))
                                                    .foregroundColor(Color(red: 151/255, green: 117/255, blue: 166/255))
                                                    Button(action: {
                                                                                       print("SOCORRO")
                                                                                   }) {
                                                                                       HStack {
                                                                                           Image(systemName: "megaphone.fill")
                                                                                               .foregroundColor(.white)
                                                                                               .font(.system(size: 40))
                                                                                           Text("SOCORRO")
                                                                                               .font(.system(size: 25))
                                                                                               .fontWeight(.bold)
                                                                                               .foregroundColor(.white)
                                                                                       }
                                                                                   }
                                                                                   .frame(width: 200, height: 80)
                                                                                   .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 219/255, green: 66/255, blue: 70/255)))
                                                }//fim hstack debaixo
                                            }
                                        
                                    )
                            }
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct Fundo: View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 151 / 255, green: 117 / 255, blue: 166 / 255))
            .scaledToFill()
        Circle()
            .fill(Color(red: 180 / 255, green: 140 / 255, blue: 180 / 255))
            .offset(x:-100,y:-300)
            .frame(width: 300)
        Circle()
            .fill(Color(red: 180 / 255, green: 140 / 255, blue: 180 / 255))
            .offset(x:140,y:-350)
            .frame(width: 205)
        Circle()
            .fill(Color(red: 180 / 255, green: 140 / 255, blue: 180 / 255))
            .offset(x:150,y:299)
            .frame(width: 450)
        Circle()
            .fill(Color(red: 180 / 255, green: 140 / 255, blue: 180 / 255))
            .offset(x:-50,y:399)
            .frame(width: 300)
        Circle()
            .fill(Color(red: 180 / 255, green: 140 / 255, blue: 180 / 255))
            .offset(x:-140,y:100)
            .frame(width: 99)
        Circle()
            .fill(Color(red: 180 / 255, green: 140 / 255, blue: 180 / 255))
            .offset(x:-70,y:70)
            .frame(width:150)
    }
}

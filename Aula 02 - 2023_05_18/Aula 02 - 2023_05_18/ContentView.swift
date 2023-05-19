//
//  ContentView.swift
//  Aula 02 - 2023_05_18
//
//  Created by Student05 on 18/05/23.
//

import SwiftUI

func minhaFuncao() -> NumberFormatter{
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumSignificantDigits = 2
    return formatter
}

struct ContentView: View {
    @State private var peso: Float = 0.00
    @State private var altura: Float = 0.00
    @State private var resultadoIMC: Float = 0.00
    @State private var corDeFundo = "white"
    @State private var corResultado = "Normal"
    
    var body: some View {
        ZStack {
            Rectangle().ignoresSafeArea().foregroundColor(Color("\(corDeFundo)"))
            VStack{
                Text("Calculadora de IMC").font(.largeTitle)
                    
                TextField("Digite Seu Peso", value: $peso, formatter: minhaFuncao()).keyboardType(.decimalPad).textContentType(.oneTimeCode).padding().background(Color.gray.opacity(0.2)).textFieldStyle(RoundedBorderTextFieldStyle()).multilineTextAlignment(.center)
                
                TextField("Digite Sua Altura", value: $altura, formatter: minhaFuncao()).keyboardType(.decimalPad).textContentType(.oneTimeCode).padding().background(Color.gray.opacity(0.2)).textFieldStyle(RoundedBorderTextFieldStyle()).multilineTextAlignment(.center)
                
                Button("Calcular"){
                    resultadoIMC = (peso)/(pow(altura, 2))
                    switch (resultadoIMC){
                        case 0...18,5:
                            corResultado = "Baixo Peso"
                            corDeFundo = "baixoPeso"
                            break
                        case 18,5...24,99:
                            corResultado = "Normal Peso"
                            corDeFundo = "normalPeso"
                            break
                        case 25...29,99:
                            corResultado = "Sobrepeso"
                            corDeFundo = "sobrepeso"
                            break
                        default:
                            corResultado = "Obesidade"
                            corDeFundo = "obesidade"
                            break
                    }
                }.controlSize(.large).buttonStyle(.borderedProminent)
                
                Spacer()
                Text("\(corResultado)").foregroundColor(.white).font(.title).bold()
                Spacer()
                
                Image("tabela-IMC").resizable().scaledToFit().shadow(radius: 5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

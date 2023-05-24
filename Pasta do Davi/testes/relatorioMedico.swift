//
//  relatorioMedico.swift
//  testes
//
//  Created by Student05 on 24/05/23.
//

import SwiftUI

struct relatorioMedico: View {
    var body: some View {
        
        
        //Elementos retirados do equipamento de medicao
        VStack{
            Text("Grafico de Media")
                .font(.largeTitle)
            
            //Inserir Grafico de Linhas (Relatorio Medico)
            
            //BOTAO DE ALERTA
            Color(.gray).opacity(0.3).ignoresSafeArea()
            Rectangle().padding().frame(width: 200.0, height: 100.0).ignoresSafeArea().foregroundColor(Color(.blue)).overlay(Text("ALERTA! H:M:S")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                )
            //Localizacao Atual do Usuario para casos de desmaio
            
        }
    }
}

struct relatorioMedico_Previews: PreviewProvider {
    static var previews: some View {
        relatorioMedico()
    }
}

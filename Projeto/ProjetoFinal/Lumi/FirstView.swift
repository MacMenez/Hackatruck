//
//  FirstView.swift
//  Lumi
//
//  Created by Student03 on 14/06/23.
//

import SwiftUI

struct FirstView: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        NavigationView {
            ZStack{
             FundoCadastro()
                VStack {
                    Image("logo").offset(y:-100)
                    NavigationLink(destination: Cadastro().navigationBarBackButtonHidden(true)) {
                        Button("Criar Conta") {

                        }.buttonStyle(.borderedProminent)
                    }

                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                        Button("Fazer Login") {

                        }.buttonStyle(.borderedProminent)
                    }
                }
                .padding()
            }
        }
    }
}


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

//
//  CharView.swift
//  Aula 06 - 2023_05_25
//
//  Created by Student05 on 25/05/23.
//

import SwiftUI

struct CharView: View{
    var p: HaPo
    var body: some View{
        ZStack{
            AsyncImage(url: URL(string: "https://img.ibxk.com.br/2021/04/19/19165615261383.jpg?ims=704x"),
                       content: {
                            image in image.resizable()
                        },
                       placeholder: {
                            ProgressView()
                
                        }).ignoresSafeArea().aspectRatio(contentMode: .fill).blur(radius: 10)
            VStack{
                AsyncImage(url: URL(string: p.image!),
                           content: {image in image.resizable().scaledToFill()},
                           placeholder: {ProgressView()}
                ).frame(width: 250, height: 250).background(Color.gray).clipShape(Circle()).padding(10)
                
                //! -> o valor e obrigatorio ter, se nao tiver o programa apresenta uma mensagem e um possivel erro
                Text(p.house!).foregroundColor(.white).bold()
                
                Text(p.name!).foregroundColor(.white).bold()
                
                //Se nao vier nada apresenta valor vazio
                Text(p.dateOfBirth! ?? "").foregroundColor(.white).bold()
                
                Text(p.eyeColour!).foregroundColor(.white).bold()
                
                Spacer()
            }.padding(.top, 70).ignoresSafeArea()
        }
    }
}

//
//  PhotoView.swift
//  Aula 03 - 2023_05_19
//
//  Created by Student05 on 19/05/23.
//

import SwiftUI

struct PhotoView: View {
    private var listaImagens = [
        "hare.fill",
        "tortoise.fill",
        "pawprint.fill",
        "ant.fill",
        "ladybug.fill"
    ]
    
    var body: some View {
        ZStack{
            Color(.brown).opacity(0.3).ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                ForEach(listaImagens, id: \.self){
                    index in
                    Image(systemName: "\(index)").font(.system(size: 150)).padding()
                }
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}

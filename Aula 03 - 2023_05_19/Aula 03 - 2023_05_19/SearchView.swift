//
//  SearchView.swift
//  Aula 03 - 2023_05_19
//
//  Created by Student05 on 19/05/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack{
            Color(.gray).opacity(0.3).ignoresSafeArea()
            Rectangle().padding().frame(width: 400.0, height: 400.0).ignoresSafeArea().foregroundColor(Color(.blue)).overlay(Text("Hello, Hackatruck!")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                )
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

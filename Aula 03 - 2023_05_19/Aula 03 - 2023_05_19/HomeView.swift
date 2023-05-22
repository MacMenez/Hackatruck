//
//  HomeView.swift
//  Aula 03 - 2023_05_19
//
//  Created by Student05 on 19/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            
            VStack{
                List(1...50, id: \.self){
                    Text("Item \($0)")
                }.background(.yellow)
                
                    .scrollContentBackground(.hidden)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

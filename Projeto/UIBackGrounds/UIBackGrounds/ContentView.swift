//
//  ContentView.swift
//  UIBackGrounds
//
//  Created by Student07 on 13/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            ZStack
            {
                Rectangle()
                    .fill(Color(red: 220 / 255, green: 192 / 255, blue: 216 / 255))
                    .frame(height: 900)
                Circle()
                    .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
                    .offset(x:-100,y:-300)
                    .frame(width: 300)
                Circle()
                    .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
                    .offset(x:150,y:-350)
                    .frame(width: 200)
                Circle()
                    .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
                    .offset(x:150,y:299)
                    .frame(width: 450)
                Circle()
                    .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
                    .offset(x:-50,y:399)
                    .frame(width: 300)
                Circle()
                    .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
                    .offset(x:-140,y:100)
                    .frame(width: 99)
                Circle()
                    .fill(Color(red: 241 / 255, green: 235 / 255, blue: 240 / 255))
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

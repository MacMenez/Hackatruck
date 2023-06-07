//
//  testeDataHora.swift
//  testes
//
//  Created by Student05 on 25/05/23.
//

import SwiftUI

class DateFormatter : Formatter{
    struct testeDataHora: View {
         let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
         
        let date = Date(timeIntervalSinceReferenceDate: 118800)
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        print(dateFormatter.string(from: date)) // Jan 2, 2001
         
        // French Locale (fr_FR)
        dateFormatter.locale = Locale(identifier: "fr_FR")
        print(dateFormatter.string(from: date)) // 2 janv. 2001
         
        // Japanese Locale (ja_JP)
        dateFormatter.locale = Locale(identifier: "ja_JP")
        print(dateFormatter.string(from: date)) // 2001/01/02
        
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSinceReferenceDate: 410220000)
         
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd") // set template after setting locale
        print(dateFormatter.string(from: date)) // December 31
         
        // British English Locale (en_GB)
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd") // // set template after setting locale
        print(dateFormatter.string(from: date)) // 31 December
}
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


struct testeDataHora_Previews: PreviewProvider {
    static var previews: some View {
        testeDataHora()
    }
}

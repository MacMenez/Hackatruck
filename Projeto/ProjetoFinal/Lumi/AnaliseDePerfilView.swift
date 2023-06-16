//
//  ContentView.swift
//  AnaliseDePerfil
//
//  Created by Student07 on 14/06/23.
//

import SwiftUI



struct AnaliseDePerfilView: View {
    
//    let contatos=[
//        Contato(id: 1, nome: "Renato", parentesco: "Filho", telefone: "12345678"),
//        Contato(id: 2, nome: "Maria", parentesco: "Filha", telefone: "12345678"),
//        Contato(id: 3, nome: "Manuel", parentesco: "Filho", telefone: "12345678"),
//        Contato(id: 4, nome: "Maria", parentesco: "Filha", telefone: "12345678"),
//        Contato(id: 5, nome: "Manuel", parentesco: "Filho", telefone: "12345678"),
//        Contato(id: 6, nome: "Maria", parentesco: "Filha", telefone: "12345678"),
//        Contato(id: 7, nome: "Manuel", parentesco: "Filho", telefone: "12345678"),
//        Contato(id: 8, nome: "Maria", parentesco: "Filha", telefone: "1234567")
//    ]
//
    
    @State var name=""
    @State var parent=""
    @State var fone=""
    @State private var showingSheet = false
    @State private var showingSheetCadastro = false
    @State private var pie = PieChart()
    @StateObject var viewmodel = ModelCadastroContato()
    
    
    
    var body: some View {
        
        ZStack
        {
            
            
            Fundo()
            ScrollView(showsIndicators: false){
                VStack
                {
                    //Spacer()
                    //  .frame(height: 90)
                    //ANALISE DE PERFIL
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color(red: 159 / 255, green: 98 / 255, blue: 164 / 255))
                            .frame(width: 300, height: 70)
                        
                            .shadow(radius: 5)
                        Text("Análise de Perfil")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .shadow(radius: 5)
                        
                    }
                    
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 187 / 255, green: 146 / 255, blue: 196 / 255))
                        .frame(width: 300,height: 280)
                        .shadow(radius: 5)
                        .overlay(
                            pie.chart(PlottableValue(name: "PA", value: 20, color: .blue), // This is variadic call
                                      PlottableValue(name: "GLC", value: 50, color: .pink),
                                      PlottableValue(name: "COGNITIVO", value: 80, color: .mint)
                                     ).shadow(radius: 5).padding()
                        )
                //CONTATOS
                ZStack
                {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color(red: 104/255, green: 58/255, blue: 104/255))
                        .frame(width: 300, height: 280)
                    
                        .shadow(radius: 5)
                    
                    VStack
                    {
                        
                        Text("Contatos Responsáveis :")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .shadow(radius: 5)
                        
                        ScrollView
                        {
                            ForEach(viewmodel.chars, id: \.id){ contato in
                                HStack{
                                    Image(systemName: "person.circle.fill")
                                        .font(.system(size: 50))
                                        .offset(x:20)
                                        .foregroundColor(.white)
                                    Button(contato.nome) {
                                        showingSheet.toggle()
                                        name = contato.nome
                                        parent = contato.parentesco
                                        fone = contato.telefone
                                    }
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .offset(x:25)
                                    .shadow(radius: 5)
                                    Spacer()}
                                
                                .sheet(isPresented: $showingSheet)
                                {
                                SheetDetailView(nname: $name, pparent: $parent, ffone: $fone)
                                }.ignoresSafeArea()
                            }
                            
                        }
                        .frame(width: 300,height: 210)
                    }
                    
                }
                Button("Adicionar Contato") {
                    showingSheetCadastro.toggle()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .shadow(radius: 5)
                .tint(Color(red: 104/255, green: 58/255, blue: 104/255))
                .sheet(isPresented: $showingSheetCadastro) {
                    CadastroContatoView()
                }
                Spacer()
                }.onAppear(){
                    viewmodel.fetch()
                }
        }
        
        
    }
}
}

struct SheetDetailView: View {
    @Binding var nname: String
    @Binding var pparent: String
    @Binding var ffone: String
    var body: some View {
        ZStack{
            
            Color(red: 242 / 255, green: 246 / 255, blue: 178 / 255)
            
          
                VStack
                {
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 100))
                        .foregroundColor(Color(red: 212 / 255, green: 120 / 255, blue: 163 / 255))
                    Spacer()
                        .frame(height: 10.0)
                    
                    Text(nname)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                   
                    Text(pparent)
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                    
                    Text(ffone)
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                    Spacer()
                    
                    Spacer()
                    
                }
                
            }
    }
}


struct BackGoundTela02: View{
    var body: some View{
        ZStack{
            Rectangle()
                .fill(Color(red: 242 / 255, green: 246 / 255, blue: 178 / 255))
            //.frame(height: 900)
                .scaledToFill()
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:-100,y:-300)
                .frame(width: 300)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:140,y:-350)
                .frame(width: 200)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:150,y:299)
                .frame(width: 450)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:-50,y:399)
                .frame(width: 300)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:-140,y:100)
                .frame(width: 99)
            Circle()
                .fill(Color(red: 241 / 255, green: 202 / 255, blue: 218 / 255))
                .offset(x:-70,y:70)
                .frame(width:150)
        }
        
    }
}

struct AnaliseDePerfilView_Previews: PreviewProvider {
    static var previews: some View {
        AnaliseDePerfilView()
    }
}

class PieChart {
    // where to position the legend
    enum Legend {
        case top, bottom, leading, trailing, hidden
    }

    //draw an segment of the pie chart
    private struct PieSegment: Shape, Identifiable {
        var data: PlottableValue
        var id: UUID { data.id }
        var startAngle: Double
        var amount: Double

        func path(in rect: CGRect) -> Path {
            let radius = min(rect.width, rect.height) * 0.5
            let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)

            var path = Path()
            path.move(to: center)
            path.addRelativeArc(center: center, radius: radius, startAngle: Angle(radians: startAngle), delta: Angle(radians: amount))
            return path
        }
    }

    /// A method to calculate the segment sizes
    /// - Parameters:
    ///   - values: PlottableValue as a variadic call to be able add as many as needed
    ///   - legend: Where the position of legend is located (default on bottom)
    /// - Returns: A View of the completed Pie Chart
    func chart(_ values: PlottableValue..., legend: Legend = .bottom) -> some View {
        let totalValue = values.reduce(0) { $0 + $1.value }
        var startAngle = -Double.pi / 2

        var pieSegments  = [PieSegment]()

        for data in values {
            let amount = .pi * 2 * (data.value / totalValue )
            let segment = PieSegment(data: data, startAngle: startAngle, amount: amount)
            pieSegments.append(segment)
            startAngle += amount
        }

       // A View of the combined segments
        var chartView: some View {
            ZStack {
                ForEach(pieSegments) { segment in
                    segment
                        .fill(segment.data.color)
                }
            }
        }

        // A View of the name of each segments
        var legendView: some View {
            ForEach(pieSegments) { segment in
                Label {
                    Text(segment.data.name)
                        .foregroundColor(.white)
                } icon: {
                    Circle()
                        .fill(segment.data.color)
                        .frame(width: 10)
                }
            }
        }

        // return View of completed switching on where chosen placement of legend
        return Group {
            switch legend {
            case .bottom:
                VStack {
                    chartView
                    HStack {
                       legendView
                    }
                }
            case .top:
                VStack {
                    HStack {
                        legendView
                    }
                    chartView
                }
            case .leading:
                HStack {
                    VStack(alignment: .leading) {
                       legendView
                    }
                    .padding(.leading)
                   chartView
                }
            case .trailing:
                HStack {
                   chartView
                    VStack(alignment: .leading) {
                       legendView
                    }
                    .padding(.trailing)
                }
            case .hidden:
                chartView
            }
        }
    }
}

struct PlottableValue: Identifiable {
    var id = UUID()
    var name: String
    var value: Double
    var color: Color
}

//
//  ContentView.swift
//  PieChart
//
//  Created by Student05 on 12/06/23.
//

//CÓDIGO DO GRÁFICO DE DOENÇAS OU OBSERVAÇÕES DE SAÚDE DOS IDOSOS

import SwiftUI

struct ContentView: View {
    //Armazenará os dados obtidos da API externa
    @State private var data: [ChartData] = []
    
    var body: some View {
        /*Exibe uma mensagem de carregamento caso data esteja vazio.
        Caso contrário, exibimos o PieChartView passando os dados obtidos.*/
        VStack {
            if data.isEmpty {
                Text("Carregando dados...")
                    .font(.title)
                    .padding()
            } else {
                PieChartView(data: data)
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
            }
        }
        .onAppear {
            fetchData()
        }
    }
    
    //Responsável por fazer a chamada à API e decodificar os dados recebidos.
    private func fetchData() {

        guard let url = URL(string: "https://example.com/api/data" /*URL pela sua própria URL da API.*/) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([ChartData].self, from: data)
                
                DispatchQueue.main.async {
                    self.data = decodedData
                }
            } catch {
                print("Erro ao decodificar os dados:", error)
            }
        }
        .resume()
    }
}

struct PieChart  {
   
    let data: [ChartData]
    
    var wedges: [Wedge] {
        let total = data.reduce(0) { $0 + $1.value }
        
        var startAngle: Double = 0
        var endAngle: Double = 0
        
        return data.map { item in
            let percentage = item.value / total
            
            endAngle = startAngle + 360 * percentage
            
            let wedge = Wedge(startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), color: .red)
            
            startAngle = endAngle
            
            return wedge
        }
    }
}

struct Wedge : Identifiable {
    let id = UUID()
    let startAngle: Angle
    let endAngle: Angle
    let color: Color
}

//Responsável por exibir o gráfico de setores.
struct PieChartView: View {
    let data: [ChartData]
    
    var body: some View {
        //GeometryReader para obter o tamanho disponível
        GeometryReader { geometry in
            //Instância da estrutura PieChart, que é responsável por calcular as fatias (wedges) do gráfico com base nos dados recebidos.
            let radius = min(geometry.size.width, geometry.size.height) / 2
            let pieChart = PieChart(data: data)
            
            ZStack {
                ForEach(pieChart.wedges) { wedge in
                    Path { path in
                        path.move(to: CGPoint(x: radius, y: radius))
                        path.addArc(center: CGPoint(x: radius, y: radius), radius: radius, startAngle: wedge.startAngle, endAngle: wedge.endAngle, clockwise: false)
                    }
                    .fill(wedge.color)
                }
                
                VStack {
                    Text("Gráfico de Setores")
                        .font(.title)
                        .padding()
                    //Percorrer os índices dos dados e acessar tanto o rótulo quanto o valor correspondente a cada fatia.
                    ForEach(data.indices) { index in
                        HStack {
                            //Representar a cor da fatia
                            Circle()
                                //.foregroundColor(data[index].color)
                                .frame(width: 12, height: 12)
                            
                            //Representar o texto da fatia
                            Text("\(data[index].label): \(data[index].value)%").font(.headline)
                        }
                        .padding(.bottom, 8)
                    }
                }
            }
        }
    }
}

//Representar os dados recebidos da API. Adota os protocolos Codable e Identifiable.
struct ChartData: Codable, Identifiable {
    let id: UUID = UUID()
    let label: String
    let value: Double
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

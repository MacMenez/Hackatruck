import SwiftUI
import Charts

struct GraficoSaudeView: View {
    var body: some View {
        ZStack{
            Fundo()
            ScrollView{
                VStack {
                    GraficoSaude()
                        .cornerRadius(25)
                        .frame(width: 350, height: 300)
                        .shadow(radius: 5)
                        Text("Gráfico de Saúde")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    RoundedRectangle(cornerRadius: 25).fill(Color(red: 104/255, green: 58/255, blue: 104/255)).frame(width: 350 , height: 350)
                        .shadow(radius: 5)
                        .overlay(VStack{
                            HStack {
                                Text("BPM: 80")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                Spacer()
                            }
                            HStack {
                                Text("Pressão:20/30")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                VStack {
                                    Button(action: {
                                        print("ALERTA")
                                    }) {
                                        HStack {
                                            Image(systemName: "exclamationmark.triangle.fill")
                                                .foregroundColor(.white)
                                                .font(.system(size: 50))
                                            Text("ALERTA H:M:S")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .frame(width: 325.0, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 219/255, green: 66/255, blue: 70/255)))
                                    .padding([.top, .trailing])
                                    
                                    Button(action: {
                                        print("SOCORRO")
                                    }) {
                                        HStack {
                                            Image(systemName: "megaphone.fill")
                                                .foregroundColor(.white)
                                                .padding(.trailing, 40.0)
                                                .font(.system(size: 50))
                                            Text("SOCORRO")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding(.trailing, 17.0)
                                        }
                                    }
                                    .frame(width: 325.0, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 219/255, green: 66/255, blue: 70/255)))
                                    .padding([.top, .trailing])
                                }
                                Spacer()
                            }
                        }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        )
                }
                .padding()
                .frame(width: 400, height: 700)
            }
        }
    }
}

struct GraficoSaudeView_Previews: PreviewProvider {
    static var previews: some View {
        GraficoSaudeView()
    }
}

struct BackgroundMain: View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 214 / 255, green: 237 / 255, blue: 170 / 255))
            .scaledToFill()
        Circle()
            .fill(Color(red: 230 / 255, green: 241 / 255, blue: 205 / 255))
            .offset(x:-100,y:-300)
            .frame(width: 300)
        Circle()
            .fill(Color(red: 230 / 255, green: 241 / 255, blue: 205 / 255))
            .offset(x:150,y:-350)
            .frame(width: 200)
        Circle()
            .fill(Color(red: 230 / 255, green: 241 / 255, blue: 205 / 255))
            .offset(x:150,y:299)
            .frame(width: 450)
        Circle()
            .fill(Color(red: 230 / 255, green: 241 / 255, blue: 205 / 255))
            .offset(x:-50,y:399)
            .frame(width: 300)
        Circle()
            .fill(Color(red: 230 / 255, green: 241 / 255, blue: 205 / 255))
            .offset(x:-140,y:100)
            .frame(width: 99)
        Circle()
            .fill(Color(red: 230 / 255, green: 241 / 255, blue: 205 / 255))
            .offset(x:-70,y:70)
            .frame(width:150)
    }
}

struct DayInfo: Identifiable {
    var id = UUID()
    var mount: String
    var value: Double
    var type: String
}

struct GraficoSaude: View {
    let data: [DayInfo] = [
        DayInfo(mount: "dom", value: 53,type: "bpm"),
        DayInfo(mount: "seg", value: 50,type: "bpm"),
        DayInfo(mount: "ter", value: 57,type: "bpm"),
        DayInfo(mount: "qua", value: 65,type: "bpm"),
        DayInfo(mount: "qui", value: 54,type: "bpm"),
        DayInfo(mount: "sex", value: 60,type: "bpm"),
        DayInfo(mount: "sab", value: 52,type: "bpm"),
        
        DayInfo(mount: "dom", value: 120,type: "pressão"),
        DayInfo(mount: "seg", value: 122,type: "pressão"),
        DayInfo(mount: "ter", value: 115,type: "pressão"),
        DayInfo(mount: "qua", value: 130,type: "pressão"),
        DayInfo(mount: "qui", value: 135,type: "pressão"),
        DayInfo(mount: "sex", value: 127,type: "pressão"),
        DayInfo(mount: "sab", value: 129,type: "pressão")
    ]
    
    var body: some View {
        
        
        List {
            Chart {
                ForEach(data) {
                    LineMark(
                        x: .value("Mount", $0.mount),
                        y: .value("Value", $0.value)
                    )
                    .foregroundStyle(by: .value("Type", "média/dia: \($0.type)"))
                    PointMark(
                        x: .value("Mount", $0.mount),
                        y: .value("Value", $0.value)
                        
                    )
                    .foregroundStyle(by: .value("Type", "média/dia: \($0.type)"))
                }
            }
            .frame(height: 250)
        }
    }
}

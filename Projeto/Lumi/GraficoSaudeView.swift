import SwiftUI

struct GraficoSaudeView: View {
    var body: some View {
        ZStack{
            BackgroundMain()
            ScrollView{
                VStack {
                    Image("YT2ph")
                        .resizable()
                        .cornerRadius(25)
                        .frame(width: 350, height: 200)
                        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.pink))
                    Text("Gráfico de Saúde")
                        .font(.title)
                        .fontWeight(.bold)
                    RoundedRectangle(cornerRadius: 25).fill(Color(red: 79    / 255, green: 27 / 255, blue: 134 / 255))
                        .overlay(VStack{
                            HStack {
                                Text("BPM:")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            HStack {
                                Text("Pressão:")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
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
                                                .foregroundColor(.red)
                                                .font(.system(size: 50))
                                            Text("ALERTA H:M:S")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .foregroundColor(.red)
                                        }
                                    }
                                    .frame(width: 325.0, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 249 / 255, green: 250 / 255, blue: 97 / 255)))
                                    .padding([.top, .trailing])
                                    
                                    Button(action: {
                                        print("SOCORRO")
                                    }) {
                                        HStack {
                                            Image(systemName: "megaphone.fill")
                                                .foregroundColor(.red)
                                                .padding(.trailing, 40.0)
                                                .font(.system(size: 50))
                                            Text("SOCORRO")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                                .foregroundColor(.red)
                                                .padding(.trailing, 17.0)
                                        }
                                    }
                                    .frame(width: 325.0, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 249 / 255, green: 250 / 255, blue: 97 / 255)))
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

//
//  ContentView.swift
//  Aula 04 - 2023_05_22
//
//  Created by Student05 on 22/05/23.
//

import SwiftUI
struct Musica: Identifiable{
    var id: Int
    var nome: String
    var artista: String
    var capa: String
}
var vetorMusicas = [
    Musica(id: 1, nome: "Skinny Ape", artista: "Gorillaz", capa: "https://i.scdn.co/image/ab67616d0000b2734b0ddebba0d5b34f2a2f07a4"),
    
    Musica(id: 2, nome: "The Fall", artista: "Dazzo, Black Jacket", capa: "https://geo-static.traxsource.com/files/images/819403_large.jpg"),
    
    Musica(id: 3, nome: "Conto de Areia", artista: "Clara Nunes", capa: "https://i.scdn.co/image/ab67616d0000b273074f4bf4548f5d1e942cd05d"),
    
    Musica(id: 4, nome: "Transplante", artista: "Raça Negra", capa: "https://i.scdn.co/image/ab67616d00001e02801255001f87d8b0ac870794"),
    
    Musica(id: 5, nome: "Sonho Meu", artista: "Sambabook", capa: "https://i.scdn.co/image/ab67616d0000b2735c4e26172fed3a250935ca79"),
    
    Musica(id: 6, nome: "Cinquentão", artista: "Zé Mulato & Cassiano", capa: "https://i.scdn.co/image/ab67616d00001e024fd698fa11f76ff7992c1b92"),
    
    Musica(id: 7, nome: "Dangerous", artista: "Roxete", capa: "https://i.scdn.co/image/ab67616d0000b273ef2c46e15c92f231fdab14e0"),
    
    Musica(id: 8, nome: "Demons Are a Girl's Best Friend", artista: "Powerwolf", capa: "https://i.scdn.co/image/ab67616d00001e02644983221910653c080b299f"),
    
    Musica(id: 9, nome: "Marry On A Cross", artista: "Gost", capa: "https://i.scdn.co/image/ab67616d0000b2733e03417574f87a0a708f8a2a"),
    
    Musica(id: 10, nome: "9INTRO", artista: "PSY", capa: "https://i.scdn.co/image/ab6761610000e5eb24b5185226d5b7c6aa91db5a")
]


struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: .init(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                VStack{
                    ScrollView{
                        VStack{
                            AsyncImage(url: URL(string: "https://scontent.fplu8-1.fna.fbcdn.net/v/t39.30808-6/298538957_489455429848754_8338744740369789501_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=e3f864&_nc_ohc=58X5O9wTbAkAX-gPwSL&_nc_ht=scontent.fplu8-1.fna&oh=00_AfB7sGF7JXejJsgiTvqQkjR0EewxlAumjCxPOWcc3qezKQ&oe=647046D7"), scale: 16/5)
                            
                            HStack{
                                Text("HackaFM").font(.largeTitle).foregroundColor(.white).padding(.leading)
                                Spacer()
                            }
                        }
                        HStack(){
                            AsyncImage(url: URL(string: "https://scontent.fplu8-1.fna.fbcdn.net/v/t39.30808-6/298538957_489455429848754_8338744740369789501_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=e3f864&_nc_ohc=58X5O9wTbAkAX-gPwSL&_nc_ht=scontent.fplu8-1.fna&oh=00_AfB7sGF7JXejJsgiTvqQkjR0EewxlAumjCxPOWcc3qezKQ&oe=647046D7"), scale: 16)
                                .padding(.leading)
                            
                            Text("HackaSong").font(.headline).foregroundColor(.white)
                            Spacer()
                        }
                        ForEach(vetorMusicas) { Musica in
                            NavigationLink(destination: RandomMusic(musicaCLicada: Musica)){
                                HStack{
                                    AsyncImage(url: URL(string: "\(Musica.capa)")) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image.resizable()
                                                .clipShape(Rectangle())
                                                .frame(maxWidth: 50, maxHeight: 50)
                                                .padding(.leading)
                                        case .failure:
                                            Image(systemName: "photo")
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                }
                                HStack{
                                    VStack{
                                        Text("\(Musica.nome)").frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("\(Musica.artista)").frame(maxWidth: .infinity, alignment: .leading)
                                    }.foregroundColor(.white)
                                    Spacer()
                                }
                                
                                HStack{Text("...")}.padding(.trailing).foregroundColor(.white)
                            }
                        }
                        
                        Text("Sugeridos").padding().font(.title).fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal){
                            HStack{
                                VStack{
                                    AsyncImage(url: URL(string: "https://static.vecteezy.com/system/resources/previews/000/421/044/original/music-note-icon-vector-illustration.jpg")) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image.resizable()
                                                .clipShape(Rectangle())
                                                .frame(maxWidth: 200, maxHeight: 200)
                                                .padding(.leading)
                                        case .failure:
                                            Image(systemName: "photo")
                                        @unknown default:
                                            EmptyView()
                                        }
                                }
                                    Text("1 - One")
                                        .foregroundColor(Color.white)
                                }
                                
                                VStack{
                                    AsyncImage(url: URL(string: "https://static.vecteezy.com/system/resources/previews/000/421/044/original/music-note-icon-vector-illustration.jpg")) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image.resizable()
                                                .clipShape(Rectangle())
                                                .frame(maxWidth: 200, maxHeight: 200)
                                                .padding(.leading)
                                        case .failure:
                                            Image(systemName: "photo")
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    Text("2 - Two")
                                        .foregroundColor(Color.white)
                                }
                                
                                VStack{
                                    AsyncImage(url: URL(string: "https://static.vecteezy.com/system/resources/previews/000/421/044/original/music-note-icon-vector-illustration.jpg")) { phase in
                                        switch phase {
                                        case .empty:
                                            ProgressView()
                                        case .success(let image):
                                            image.resizable()
                                                .clipShape(Rectangle())
                                                .frame(maxWidth: 200, maxHeight: 200)
                                                .padding(.leading)
                                        case .failure:
                                            Image(systemName: "photo")
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    Text("3 - Three")
                                        .foregroundColor(Color.white)
                                }
                                
                            }
                        }
                    }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

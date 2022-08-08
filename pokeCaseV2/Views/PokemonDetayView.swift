//
//  PokemonDetayView.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 3.08.2022.
//

import SwiftUI
import FirebaseRemoteConfig
import FirebaseCrashlytics

struct PokemonDetayView: View {
    
    @State var pokemonUrl : String
    @State var bigPic : Int = 1
    
    @State private var  bilgiler : PokemonSelectedDetail?
    @State var nilOlmayanSpritelerStringDizi : [String] = [""]
    
    @State private var remoteConfig = RemoteConfig.remoteConfig()
    
    @State private var renk1 = Color.cyan
    @State private var renk2 = Color.pink
    
    @State private var detayRenkBool : Bool?
    
    
    

    
    
    
    
    
    var body: some View {
        
        
        
        ZStack{
            if detayRenkBool == true {
                Color.cyan.opacity(20.0).ignoresSafeArea()
            }
            else if detayRenkBool == false {
                Color.mint.opacity(20.0).ignoresSafeArea()
            }
            else{
                Text("Veri Yok")
            }
            ScrollView {
                VStack{
                    
                    if bilgiler == nil {
                        Text("Yükleniyor")
                    }else{
                        
                        HStack {
                            Text(bilgiler?.name.uppercased() ?? "Yükleniyor")
                                .frame(width: 180, height: 60, alignment: .center)
                                .foregroundColor(.blue)
                                .font(.title2.bold())
                            Spacer()
                            Text("#\(bigPic)")
                                .foregroundColor(.blue)
                                .font(.title2.bold())
                                .padding(.trailing,10)
                            
                        }.background(.yellow)
                        
                        AsyncImage(url: URL(string: bilgiler?.sprites.front_default ?? ""))
                        
                            .cornerRadius(8)
                        
                        ScrollView(.horizontal){
                            
                            HStack(spacing: 10){
                                
                                ForEach(nilOlmayanSpritelerStringDizi, id: \.self){sprite in
                                    
                                    AsyncImage(url: URL(string: sprite))
                                        .padding(.horizontal,10)
                                }
                            }
                        }.padding()
                            .padding(.top,5)
                        
                        
                        ZStack {
                            Color.yellow.ignoresSafeArea()
                            VStack(){
                                Text("stats")
                                    .padding()
                                    .font(.title.bold().bold().bold())
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("healthPointStat")
                                            .padding(5)
                                        Text("attackStat")
                                            .padding(5)
                                        Text("defenseStat")
                                            .padding(5)
                                        Text("spAttackStat")
                                            .padding(5)
                                        Text("spDefenseStat")
                                            .padding(5)
                                    }
                                    .padding()
                                    Spacer()
                                    VStack{
                                        Text(":")
                                            .padding(5)
                                        Text(":")
                                            .padding(5)
                                        Text(":")
                                            .padding(5)
                                        Text(":")
                                            .padding(5)
                                        Text(":")
                                            .padding(5)
                                    }
                                    Spacer()
                                    VStack{
                                        Text("\((bilgiler?.stats[0].base_stat) ?? 0)")
                                            .padding(5)
                                        Text("\((bilgiler?.stats[1].base_stat) ?? 0)")
                                            .padding(5)
                                        Text("\((bilgiler?.stats[2].base_stat) ?? 0)")
                                            .padding(5)
                                        Text("\((bilgiler?.stats[3].base_stat) ?? 0)")
                                            .padding(5)
                                        Text("\((bilgiler?.stats[4].base_stat) ?? 0)")
                                            .padding(5)
                                    }
                                    .padding()
                                    Spacer()
                                    VStack{
                                        StatItemBarView(barDegeri: (bilgiler?.stats[0].base_stat! ?? 0))
                                            .padding(.bottom,5)
                                        StatItemBarView(barDegeri: (bilgiler?.stats[1].base_stat! ?? 0))
                                            .padding(.bottom,5)
                                        
                                        StatItemBarView(barDegeri: (bilgiler?.stats[2].base_stat! ?? 0))
                                            .padding(.bottom,5)
                                        
                                        StatItemBarView(barDegeri: (bilgiler?.stats[3].base_stat! ?? 0))
                                            .padding(.bottom,5)
                                        
                                        StatItemBarView(barDegeri: (bilgiler?.stats[4].base_stat! ?? 0))
                                            .padding(.bottom,5)
                                        
                                    }.padding(.trailing,5)
                                }
                                
                                Spacer()
                                
                                Text("Pokemon : \(pokemonUrl)")
                                    .foregroundColor(.green)
                                    .font(.callout)
                                    .padding(.vertical,30)
                                
                                Button("Crash") {
                                  fatalError("Crash was triggered")
                                }
                                
                            }.background(.white)
                        }
                    }
                }.onAppear{
                    ApiPokemontoDetailClass().detayVeriGetir(detayUrl: pokemonUrl){ detay in
                        
                        self.bilgiler = detay
                        
                        
                        nilOlmayanSpritelerStringDizi = nilFiltrele(veri: bilgiler?.sprites ?? PokemonSpritesDetail())
                        
                        print(nilOlmayanSpritelerStringDizi)
                        print(bilgiler?.id)
                        
                        self.bigPic = bilgiler?.id ?? 1
                    }
                }
            }
        }.onAppear{
            print("Ztack Bracket")
            print("wuhuuuuu")
            
            DispatchQueue.main.async {
                fetchFirebase()
                print("detayRenkBool : \(detayRenkBool)")
            }
            
        }
    }
    
    func fetchFirebase(){
        var sonuc : Bool?
        
        //arkaRenk
        
        let defaultColor : [String : NSObject] = ["arkaRenk" : false as NSObject]
        
        remoteConfig.setDefaults(defaultColor)
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        print("içerde")
        self.remoteConfig.fetch(withExpirationDuration: 0, completionHandler: {status, error in
            
            if status == .success, error == nil {
                
                self.remoteConfig.activate(completion: { gelenDeger,error  in

                    print("Kendi istediği parametre gelen Değer Sanırım hata yok demek : \(gelenDeger)")
                    print("error : \(error?.localizedDescription)")
                    
                    guard error == nil else{
                        print("olmadı be")
                        return
                    }
                    
                    //print("oldu sanırım")
                    
                    let value = self.remoteConfig.configValue(forKey: "arkaRenk").boolValue
                    print("Fetched öncesi sonuc : \(sonuc)")
                    print("Fetched : \(value)")
                    sonuc = value
                    print("Fetched sonrası sonuc : \(sonuc)")
                    
                    detayRenkBool = sonuc
                    
                    
                })
                
            }else{
                print("something went wrong")
            }
            
        })
        print("sonuc : \(sonuc)")
        
    }
    
    
    
}


struct PokemonDetayView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetayView(pokemonUrl: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}

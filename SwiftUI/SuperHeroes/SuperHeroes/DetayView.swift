//
//  DetayView.swift
//  SuperHeroes
//
//  Created by Emir Keleş on 3.06.2023.
//

import SwiftUI

struct DetayView: View {
    var secilenKahraman : Superkahraman
    
    var body: some View {
        

            VStack {
                MapView(coordinate: secilenKahraman.koordinatLokasyonu)
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    .edgesIgnoringSafeArea(.top)
                OzelGorselView(image: Image(secilenKahraman.gorselIsmi))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                    .offset(y: UIScreen.main.bounds.height * -0.18)
                
                
                HStack {
                    VStack {
                        Text("İsim")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.indigo)
                            .padding()
                        Text("Meslek")
                            .font(.largeTitle)
                            .padding()
                            .bold()
                            .foregroundColor(.indigo)
                        Text("Şehir")
                            .foregroundColor(.indigo)
                            .padding()
                            .font(.largeTitle)
                            .bold()
                    }
                    Spacer()
                    VStack {
                        Text(secilenKahraman.gercekIsim)
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.black)
                        Text(secilenKahraman.meslek)
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.black)
                        Text(secilenKahraman.sehir)
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(.black)
                    }
                    
                }.padding()
                    .offset(y: UIScreen.main.bounds.height * -0.18)
            }
        }
    }
        
    

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(secilenKahraman: superman)
    }
}

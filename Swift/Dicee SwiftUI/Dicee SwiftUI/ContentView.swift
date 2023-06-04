//
//  ContentView.swift
//  Dicee SwiftUI
//
//  Created by Emir Keleş on 8.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background").resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button("Roll") {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }
                
                .font(.system(size: 50))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .background(Color.red)
                .padding(.bottom)
            }
            
        }
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)").resizable().aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



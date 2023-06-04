//
//  ContentView.swift
//  SuperHeroes
//
//  Created by Emir Keleş on 2.06.2023.
//

import SwiftUI

struct ListeView: View {
    var body: some View {
        NavigationView {
            List(superKahramanDizisi) { superKahraman in
                NavigationLink {
                    DetayView(secilenKahraman: superKahraman)
                } label: {
                    ListeRowView(superkahraman: superKahraman)
                }

            }.navigationTitle("Super Kahraman Kitabı")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListeView()
    }
}

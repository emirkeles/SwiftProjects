//
//  ListeRowView.swift
//  SuperHeroes
//
//  Created by Emir Keleş on 3.06.2023.
//

import SwiftUI

struct ListeRowView: View {
    var superkahraman: Superkahraman
    var body: some View {
        HStack {
            Image(superkahraman.gorselIsmi)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .leading)
            Spacer()
                Text(superkahraman.isim).font(.title).bold()
            Spacer()
        }.padding()
    }
}

struct ListeRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListeRowView(superkahraman: batman)
    }
}

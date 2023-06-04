//
//  InfoView.swift
//  EmirCard
//
//  Created by Emir Keleş on 8.04.2023.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(height: 50)
                .overlay(HStack {
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                })
                .padding(.all)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
        
    }
}

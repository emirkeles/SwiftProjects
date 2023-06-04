//
//  OzelImageView.swift
//  MovieSearch
//
//  Created by Emir Keleş on 3.06.2023.
//

import SwiftUI

struct OzelImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url: String) {
        self.url = url
        self.imageDownloaderClient.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.downloadedImage {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("placeholder")
                .resizable()
        }
    }
}

struct OzelImageView_Previews: PreviewProvider {
    static var previews: some View {
        OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_SX300.jpg")
    }
}

//
//  DetailView.swift
//  MovieSearch
//
//  Created by Emir Keleş on 4.06.2023.
//

import SwiftUI

struct DetailView: View {
    
    let imdbId : String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {

            VStack{
                Text("IMDB: \(movieDetailViewModel.movieDetail?.imdbRating ?? "")").font(.largeTitle).foregroundColor(.red).frame(alignment: .center)
                HStack {
                    Spacer()
                    OzelImage(url: movieDetailViewModel.movieDetail?.poster ?? "")
                        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                    Spacer()
                }
                Text(movieDetailViewModel.movieDetail?.title ?? "").padding().font(.largeTitle)
            }
            
            Text(movieDetailViewModel.movieDetail?.plot ?? "").padding().fixedSize(horizontal: false, vertical: true)
            Text("Yönetmen: \(movieDetailViewModel.movieDetail?.director ?? "")").padding().fixedSize(horizontal: false, vertical: true)
            Text("Yazar: \(movieDetailViewModel.movieDetail?.writer ?? "")").padding().fixedSize(horizontal: false, vertical: true)
            Text("Ödüller: \(movieDetailViewModel.movieDetail?.awards ?? "")").padding().fixedSize(horizontal: false, vertical: true)
            Text("Yıl: \(movieDetailViewModel.movieDetail?.year ?? "")").padding()
            Spacer()
            
        }.onAppear {
            self.movieDetailViewModel.getMovieDetail(imdbId: imdbId)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "tt2911666")
    }
}

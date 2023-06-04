//
//  MovieDetailViewModel.swift
//  MovieSearch
//
//  Created by Emir Keleş on 4.06.2023.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetail : MovieDetailView?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetail(imdbId : String) {
        downloaderClient.downloadMovieDetail(imdbID: imdbId) { sonuc in
            switch sonuc{
            case .failure(let hata):
                print(hata)
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailView(movieDetail: movieDetail)
                }
                
            }
        }
    }
    
    
}

struct MovieDetailView {
    let movieDetail : MovieDetail
    
    var title : String {
        movieDetail.title
    }
    var year : String {
        movieDetail.year
    }
    var genre : String {
        movieDetail.genre
    }
    var director : String {
        movieDetail.director
    }
    var writer : String {
        movieDetail.writer
    }
    var actors : String {
        movieDetail.actors
    }
    var awards : String {
        movieDetail.awards
    }
    var poster : String {
        movieDetail.poster
    }
    var metascore : String {
        movieDetail.metascore
    }
    var imdbRating : String {
        movieDetail.imdbRating
    }
    var imdbId : String {
        movieDetail.imdbId
    }
    var plot : String {
        movieDetail.plot
    }
    
    
}

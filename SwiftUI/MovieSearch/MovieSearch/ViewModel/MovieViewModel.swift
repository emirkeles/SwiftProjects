//
//  MovieViewModel.swift
//  MovieSearch
//
//  Created by Emir Keleş on 3.06.2023.
//

import Foundation
import SwiftUI

class MovieListViewModel : ObservableObject {
    
    let downloaderClient = DownloaderClient()
    
    @Published var movies = [MovieViewModel]()
    
    
    func searchMovie(movieName: String) {
        downloaderClient.downloadMovies(search: movieName) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movieList):
                if let movieList = movieList {
                    DispatchQueue.main.async {
                        self.movies = movieList.map(MovieViewModel.init)
                    }
                }
            }
        }
    }
}

struct MovieViewModel {
    let movie : Movie
    
    var title : String {
        movie.title
    }
    
    var poster : String {
        movie.poster
    }
    
    var year : String {
        movie.year
    }
    
    var imdbId : String {
        movie.imdbId
    }
    
}

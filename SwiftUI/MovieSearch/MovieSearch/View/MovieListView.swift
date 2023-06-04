//
//  ContentView.swift
//  MovieSearch
//
//  Created by Emir Keleş on 3.06.2023.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var aranacakFilm = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        self.movieListViewModel.searchMovie(movieName: "titanic")
    }
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                TextField("Film ismi giriniz", text: $aranacakFilm) {
                    self.movieListViewModel.searchMovie(movieName: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                List(movieListViewModel.movies, id: \.imdbId) { movie in
                    NavigationLink {
                        DetailView(imdbId: movie.imdbId)
                    } label: {
                        HStack {
                            OzelImage(url: movie.poster)
                                .frame(width: 90, height: 130)
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                Text(movie.year)
                                    .foregroundColor(.red)
                            }
                        }
                    }

                    
                }.navigationTitle("Movie Book")
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

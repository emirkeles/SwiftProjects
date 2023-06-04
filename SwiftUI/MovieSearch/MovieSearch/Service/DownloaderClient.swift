//
//  DownloaderClient.swift
//  MovieSearch
//
//  Created by Emir Keleş on 3.06.2023.
//

import Foundation

class DownloaderClient {
    
    func downloadMovies(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=3596c69e") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data)
            else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(filmCevabi.movies))
            
        }.resume()
        
    }
    
    func downloadMovieDetail(imdbID:String, completion: @escaping (Result<MovieDetail, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=3596c69e") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            guard let gelenFilmDetayi = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(gelenFilmDetayi))
            
        }.resume()
        
    }
    
    
    
}

enum DownloaderError: Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}

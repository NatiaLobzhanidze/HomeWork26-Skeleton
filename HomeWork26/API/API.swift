//
//  API.swift
//  HomeWork26
//
//  Created by Natia's Mac on 25/11/2021.
//

import Foundation
class APIManager {
    
    func getMovie(completion: @escaping (([MovieModel]) -> Void)) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=a0aba78a00d2acb51bf5318879fcfa07") else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                print(error)
            }

            guard let data = data else {return}
            
            do {
                let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
                
                completion(decoded.results)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}

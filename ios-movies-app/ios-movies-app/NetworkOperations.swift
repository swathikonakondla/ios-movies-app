//
//  NetworkOperations.swift
//  ios-movies-app
//  Created by Swathi on 05/10/2019.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class NetworkOperations {
    
    private let baseUrl: String = "https://api.themoviedb.org/3/movie"
    public private(set) var posterBaseUrl: String = "https://image.tmdb.org/t/p/w185"
    public private(set) var youtubeBaseUrl: String = "https://www.youtube.com/watch"
    private let apiKey: String
    
    init() {
        apiKey = Utilities().getApiKey()
    }
    
    public func getMovies(category: String, page: Int, completionHandler: @escaping () -> Void) {
        let parameters = [
            "api_key": apiKey,
            "page": String(page)
        ]
        
        Alamofire
            .request(baseUrl + "/" + category, parameters: parameters)
            .responseString(completionHandler: { (response: DataResponse<String>) in
                switch response.result {
                case .success(let movies):
                    let movieCollection = Mapper<MovieCollectionDto>()
                        .map(JSONString: movies)
                    
                    movieCollection?.insert(into: category, deleteOldData: page == 1, completionHandler: completionHandler)
                case .failure(let error):
                    print("Error: NetworkOperation getMovies: \(error)")
                
                }
            })
    }
    
    public func getMovieDetails(movieId: Int64, completionHandler: @escaping () -> Void) {
        let parameters = [
            "api_key": apiKey,
            "append_to_response": "trailers,reviews"
        ]
        
        Alamofire
            .request(baseUrl + "/" + String(movieId), parameters: parameters)
            .responseString(completionHandler: { (response: DataResponse<String>) in
                switch response.result {
                case .success(let movie):
                    let movieDetails = Mapper<MovieDto>()
                        .map(JSONString: movie)
                    
                    movieDetails?.update(completionHandler: completionHandler)
                case .failure(let error):
                    print("Error: NetworkOperation getMovieDetails: \(error)")
                }
            })
    }
}

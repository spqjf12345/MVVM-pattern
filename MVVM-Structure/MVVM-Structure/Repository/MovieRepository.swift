//
//  File.swift
//  MVVM-Structure
//
//  Created by JoSoJeong on 2022/01/09.
//

import Foundation
import Combine
import Alamofire

class MovieRepository {
    
    public func fetchMovieList(query: String) -> AnyPublisher<Result<Movie, Error>, Error> {
        let query = "https://openapi.naver.com/v1/search/movie.json?query=\(query)"
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let request = URLRequest(url: URL(string: encodedQuery!)!)
        return AF.request(request)
            .validate()
            .publishDecodable(type: Movie.self)
            .tryCompactMap { (response) in
                if let error = response.error { throw error }
            }
            .eraseToAnyPublisher()
    }
    
    public func fetchDetailList(id: Int) -> AnyPublisher< Result<Movie, Error>, Error>{
        let query = "https://openapi.naver.com/v1/search/movie.json?query=\(id)"
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let request = URLRequest(url: URL(string: encodedQuery!)!)
        return AF.request(request)
            .validate()
            .publishDecodable(type: Movie.self)
            .tryCompactMap { (response) in
                if let error = response.error { throw error }
            }
            .eraseToAnyPublisher()
    }
}


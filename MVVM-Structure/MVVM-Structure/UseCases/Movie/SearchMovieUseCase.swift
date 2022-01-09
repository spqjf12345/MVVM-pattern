//
//  MovieUseCase.swift
//  MVVM-Structure
//
//  Created by JoSoJeong on 2022/01/09.
//

import Foundation
import Combine
import UIKit.UIImage

protocol MovieUseCaseType {
    /// Runs movies search with a query string
    func searchMovies(with query: String) -> AnyPublisher<Result<Movie, Error>, Error>

    /// Fetches details for movie with specified id
    func movieDetails(with id: Int) -> AnyPublisher<Result<Movie, Error>, Error>

    // Loads image for the given movie
    func loadImage(for movie: Movie)

}
class MovieUseCase: MovieUseCaseType {
    
    private let moviesRepository: MovieRepository
    
    init(moviesRepository: MovieRepository) {
        self.moviesRepository = moviesRepository
    }
    
    func searchMovies(with query: String) -> AnyPublisher<Result<Movie, Error>, Error> {
        return moviesRepository
        .fetchMovieList(query: query)
    }
    
    func movieDetails(with id: Int) -> AnyPublisher<Result<Movie, Error>, Error> {
        return moviesRepository.fetchDetailList(id: id)
    }
    
    func loadImage(for movie: Movie) {
        
    }
   
}

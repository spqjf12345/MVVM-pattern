//
//  MovieViewModels.swift
//  MVVM-Structure
//
//  Created by JoSoJeong on 2022/01/09.
//

import Foundation
import Combine

struct MoviesListViewModelActions {
    let showMovieDetails: (Movie) -> Void
    let showMovieQueriesSuggestions: (@escaping (_ didSelect: MovieQuery) -> Void) -> Void
    let closeMovieQueriesSuggestions: () -> Void
}

protocol MoviesListViewModelInput {
    func didLoadNextPage()
    func didSearch(query: String)
    func didCancelSearch()
    func showQueriesSuggestions()
    func closeQueriesSuggestions()
    func didSelectItem(at index: Int)
}

protocol MoviesListViewModelOutput {
    var items: AnyPublisher<[MovieViewModel], Never> { get }
    var query: AnyPublisher<String, Never> { get }
    var screenTitle: String { get }
    var emptyDataTitle: String { get }
    var errorTitle: String { get }
    var searchBarPlaceholder: String { get }
}

typealias MoviesListViewModel = MoviesListViewModelInput & MoviesListViewModelOutput

struct MovieViewModel: MoviesListViewModel {
    
    private let moviesUseCase: MovieUseCase
    private let actions: MoviesListViewModelActions?
    
    var currentPage: Int = 0
    var totalPageCount: Int = 1
    var hasMorePages: Bool { currentPage < totalPageCount }
    var nextPage: Int { hasMorePages ? currentPage + 1 : currentPage }
    
    // MARK: - OUTPUT
    var items: AnyPublisher<[MovieViewModel], Never> = Just([]).eraseToAnyPublisher()
    var query: AnyPublisher<String, Never> = Just("").eraseToAnyPublisher()
    var screenTitle = NSLocalizedString("Movies", comment: "")
    var emptyDataTitle = NSLocalizedString("Search results", comment: "")
    var errorTitle = NSLocalizedString("Error", comment: "")
    var searchBarPlaceholder: String =  NSLocalizedString("Search Movies", comment: "")
    
    // MARK: - INIT
    init(searchMoviesUseCase: MovieUseCase,
         actions: MoviesListViewModelActions? = nil) {
        self.moviesUseCase = searchMoviesUseCase
        self.actions = actions
    }
    
//    let title: String
//    let releaseDate: String
//    let posterImagePath: String?
    
    func didLoadNextPage() {
        <#code#>
    }
    
    func didSearch(query: String) {
        <#code#>
    }
    
    func didCancelSearch() {
        <#code#>
    }
    
    func showQueriesSuggestions() {
        <#code#>
    }
    
    func closeQueriesSuggestions() {
        <#code#>
    }
    
    func didSelectItem(at index: Int) {
        actions?.showMovieDetails(pages.movies[index])
    }
    
    
    

//    init(movie: Movie) {
//        self.title = movie.title ?? ""
//        self.posterImagePath = movie.imageURL ?? ""
//        self.releaseDate = movie.pubDate
//    }
}



//private let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .medium
//    return formatter
//}()


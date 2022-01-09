//
//  Movie.swift
//  MVVM-Structure
//
//  Created by JoSoJeong on 2022/01/09.
//

import Foundation

struct Movie: Encodable {
    var title: String
    var link: String
    var imageURL: String
    var image: UIImage
    var pubDate: String
    var director: String
    var actors: String
    var userRating: String
}

struct MoviesPage: Equatable {
    let page: Int
    let totalPages: Int
    let movies: [Movie]
}

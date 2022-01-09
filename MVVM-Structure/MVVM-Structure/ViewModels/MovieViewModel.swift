//
//  MovieViewModels.swift
//  MVVM-Structure
//
//  Created by JoSoJeong on 2022/01/09.
//

import Foundation
import UIKit

class MovieViewModel: NSObject {
    var list: [Movie] = []
    
    var count: Int {
        return list.count
    }
}

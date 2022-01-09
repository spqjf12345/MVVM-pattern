//
//  ListModels.swift
//  MVVM-Structure
//
//  Created by JoSoJeong on 2022/01/09.
//

import Foundation
import UIKit

class ListModels: NSObject {
    var list: [String] = ["search"]
    
    var count: Int {
        return list.count
    }

}

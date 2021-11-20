//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by JoSoJeong on 2021/11/20.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation


struct AddCoffeOrderViewModel {
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeeType.allCases.map{ $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map{ $0.rawValue.capitalized }
    }
}

//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by JoSoJeong on 2021/11/20.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

class OrderListModel {
    var ordersViewModel: [OrderViewModel]
    
    init(){
        self.ordersViewModel =  [OrderViewModel]()
    }
}

extension OrderListModel {
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order
}

extension OrderViewModel {
    var name: String {
        return self.order.name
    }
    
    var email: String {
        return self.order.email
    }
    
    var type: String {
        return self.order.type.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}

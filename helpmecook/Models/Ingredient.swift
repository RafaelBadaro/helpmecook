//
//  Ingredient.swift
//  helpmecook
//
//  Created by Rafael Badaró on 10/08/24.
//

import Foundation

class Ingredient: Identifiable {
    var id: UUID
    var name: String
    var quantity: String //TODO - this needs thinking, for example we have 1 table spoon, 500g of chicken, 100ml ...
    
    init(id: UUID = UUID(), name: String, quantity: String) {
        self.id = id
        self.name = name
        self.quantity = quantity
    }
    
}

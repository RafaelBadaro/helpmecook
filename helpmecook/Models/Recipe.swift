//
//  Recipe.swift
//  helpmecook
//
//  Created by Rafael Badaró on 02/08/24.
//

import Foundation
import SwiftUI

class Recipe: Identifiable {
    var id: UUID
    var image: String
    var title: String
    var description: String
    var timesDone: Int
    
    init(id: UUID = UUID(), image: String, title: String, description: String, timesDone: Int = 0) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.timesDone = timesDone
    }
    
    var backgroundColor: Color {
        timesDone > 0 ? .green.opacity(0.12) : .gray.opacity(0.1)
    }
}


extension Recipe {
    static let sampleData: [Recipe] = [
        Recipe(image: "🍗", title: "Chicken Breast", description: "Juicy and tender chicken breast", timesDone: 1),
        Recipe(image: "🍝", title: "Spaghetti Carbonara", description: "Classic Italian pasta with creamy sauce"),
        Recipe(image: "🥗", title: "Caesar Salad", description: "Crisp romaine lettuce with creamy Caesar dressing"),
        Recipe(image: "🥩", title: "Grilled Ribeye", description: "Perfectly grilled ribeye steak"),
        Recipe(image: "🍲", title: "Tomato Soup", description: "Rich and creamy tomato soup"),
        Recipe(image: "🍩", title: "Chocolate Cake", description: "Decadent and moist chocolate cake")
    ]
}


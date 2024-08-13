//
//  Recipe.swift
//  helpmecook
//
//  Created by Rafael Badaró on 02/08/24.
//

import Foundation
import SwiftUI

class Recipe: Identifiable, ObservableObject {
    var id: UUID
    var image: String
    var title: String
    var description: String
    var timesDone: Int
    var ingredients: [Ingredient]
    var stepByStep: [Step]
    
    init(id: UUID = UUID(), image: String, title: String, description: String, timesDone: Int = 0, ingredients: [Ingredient], stepByStep: [Step]) {
        self.id = id
        self.image = image
        self.title = title
        self.description = description
        self.timesDone = timesDone
        self.ingredients = ingredients
        self.stepByStep = stepByStep
    }
    
    var backgroundColor: Color {
        timesDone > 0 ? .green.opacity(0.12) : .gray.opacity(0.1)
    }
}


extension Recipe {
    static let sampleData: [Recipe] = [
        Recipe(
            image: "🍗",
            title: "Chicken Breast",
            description: "Juicy and tender chicken breast",
            timesDone: 1,
            ingredients: [
                Ingredient(name: "Chicken breast", quantity: "500g"),
                Ingredient(name: "Olive oil", quantity: "2 tbsp"),
                Ingredient(name: "Garlic", quantity: "2 cloves"),
                Ingredient(name: "Lemon", quantity: "1"),
                Ingredient(name: "Salt", quantity: "to taste"),
                Ingredient(name: "Pepper", quantity: "to taste")
            ],
            stepByStep: Step.chickenBreastSteps
        ),
        Recipe(
            image: "🍝",
            title: "Spaghetti Carbonara",
            description: "Classic Italian pasta with creamy sauce",
            ingredients: [
                Ingredient(name: "Spaghetti", quantity: "200g"),
                Ingredient(name: "Eggs", quantity: "2"),
                Ingredient(name: "Pancetta", quantity: "100g"),
                Ingredient(name: "Parmesan cheese", quantity: "50g"),
                Ingredient(name: "Black pepper", quantity: "to taste"),
                Ingredient(name: "Salt", quantity: "to taste")
            ],
            stepByStep: Step.spaghettiCarbonaraSteps
        ),
        Recipe(
            image: "🥗",
            title: "Caesar Salad",
            description: "Crisp romaine lettuce with creamy Caesar dressing",
            ingredients: [
                Ingredient(name: "Romaine lettuce", quantity: "1 head"),
                Ingredient(name: "Caesar dressing", quantity: "100ml"),
                Ingredient(name: "Parmesan cheese", quantity: "50g"),
                Ingredient(name: "Croutons", quantity: "1 cup"),
                Ingredient(name: "Anchovies", quantity: "3"),
                Ingredient(name: "Garlic", quantity: "1 clove")
            ],
            stepByStep: Step.caesarSaladSteps
        ),
        Recipe(
            image: "🥩",
            title: "Grilled Ribeye",
            description: "Perfectly grilled ribeye steak",
            ingredients: [
                Ingredient(name: "Ribeye steak", quantity: "1"),
                Ingredient(name: "Olive oil", quantity: "1 tbsp"),
                Ingredient(name: "Salt", quantity: "to taste"),
                Ingredient(name: "Pepper", quantity: "to taste"),
                Ingredient(name: "Garlic powder", quantity: "1 tsp"),
                Ingredient(name: "Rosemary", quantity: "1 sprig")
            ],
            stepByStep: Step.grilledRibeyeSteps
        ),
        Recipe(
            image: "🍲",
            title: "Tomato Soup",
            description: "Rich and creamy tomato soup",
            ingredients: [
                Ingredient(name: "Tomatoes", quantity: "1kg"),
                Ingredient(name: "Onion", quantity: "1"),
                Ingredient(name: "Garlic", quantity: "2 cloves"),
                Ingredient(name: "Olive oil", quantity: "2 tbsp"),
                Ingredient(name: "Vegetable broth", quantity: "500ml"),
                Ingredient(name: "Cream", quantity: "100ml"),
                Ingredient(name: "Salt", quantity: "to taste"),
                Ingredient(name: "Pepper", quantity: "to taste")
            ],
            stepByStep: Step.tomatoSoupSteps
        ),
        Recipe(
            image: "🍩",
            title: "Chocolate Cake",
            description: "Decadent and moist chocolate cake",
            ingredients: [
                Ingredient(name: "Flour", quantity: "200g"),
                Ingredient(name: "Sugar", quantity: "200g"),
                Ingredient(name: "Cocoa powder", quantity: "50g"),
                Ingredient(name: "Baking powder", quantity: "1 tsp"),
                Ingredient(name: "Baking soda", quantity: "1 tsp"),
                Ingredient(name: "Salt", quantity: "1/2 tsp"),
                Ingredient(name: "Eggs", quantity: "2"),
                Ingredient(name: "Milk", quantity: "200ml"),
                Ingredient(name: "Vegetable oil", quantity: "100ml"),
                Ingredient(name: "Vanilla extract", quantity: "1 tsp"),
                Ingredient(name: "Boiling water", quantity: "200ml")
            ],
            stepByStep: Step.chocolateCakeSteps
        )
    ]
}

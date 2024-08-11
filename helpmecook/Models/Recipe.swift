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
    var stepByStep: [String]
    
    init(id: UUID = UUID(), image: String, title: String, description: String, timesDone: Int = 0, ingredients: [Ingredient], stepByStep: [String]) {
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
               stepByStep: [
                   "Season the chicken breast with salt, pepper, and garlic.",
                   "Heat the olive oil in a pan over medium heat.",
                   "Cook the chicken breast for 5-7 minutes on each side until golden brown.",
                   "Squeeze lemon juice over the chicken before serving."
               ]
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
               stepByStep: [
                   "Cook the spaghetti according to package instructions.",
                   "Fry the pancetta until crispy.",
                   "Whisk the eggs and parmesan cheese together in a bowl.",
                   "Drain the spaghetti and return it to the pot.",
                   "Add the pancetta and egg mixture to the spaghetti and mix well.",
                   "Season with black pepper and salt to taste."
               ]
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
               stepByStep: [
                   "Chop the romaine lettuce into bite-sized pieces.",
                   "Toss the lettuce with Caesar dressing.",
                   "Add croutons, parmesan cheese, and anchovies.",
                   "Mix well and serve immediately."
               ]
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
               stepByStep: [
                   "Season the ribeye steak with salt, pepper, and garlic powder.",
                   "Heat the olive oil in a grill pan over high heat.",
                   "Grill the steak for 4-5 minutes on each side for medium-rare.",
                   "Add the rosemary to the pan and baste the steak with the juices.",
                   "Let the steak rest for 5 minutes before slicing and serving."
               ]
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
               stepByStep: [
                   "Chop the tomatoes, onion, and garlic.",
                   "Heat the olive oil in a pot and sauté the onion and garlic.",
                   "Add the tomatoes and cook until soft.",
                   "Pour in the vegetable broth and simmer for 20 minutes.",
                   "Blend the soup until smooth and stir in the cream.",
                   "Season with salt and pepper to taste before serving."
               ]
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
               stepByStep: [
                   "Preheat the oven to 175°C (350°F).",
                   "Mix the dry ingredients together in a bowl.",
                   "Add the eggs, milk, vegetable oil, and vanilla extract to the dry ingredients.",
                   "Mix well and then slowly add the boiling water.",
                   "Pour the batter into a greased baking pan.",
                   "Bake for 30-35 minutes or until a toothpick inserted into the center comes out clean.",
                   "Let the cake cool before serving."
               ]
           )
       ]
}


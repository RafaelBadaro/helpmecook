//
//  helpmecookApp.swift
//  helpmecook
//
//  Created by Rafael Badaró on 02/08/24.
//

import SwiftUI

@main
 struct helpmecookApp: App {
    let recipes: [Recipe] = Recipe.sampleData
    
    var body: some Scene {
        WindowGroup {
            RecipesView(recipes: recipes)
        }
    }
}

//
//  RecipesView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 02/08/24.
//

import SwiftUI

struct RecipesView: View {
    let recipes: [Recipe]
    
    var body: some View {
        NavigationStack {
            List(recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                    RecipeRowView(recipe: recipe)
                }
                .listRowBackground(recipe.backgroundColor)
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    RecipesView(recipes: Recipe.sampleData)
}

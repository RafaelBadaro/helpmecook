//
//  RecipeDetailView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 10/08/24.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack{
            List {
                Section(header: Text("Ingredients").font(.headline)) {
                    ForEach(recipe.ingredients) { ingredient in
                        HStack {
                            Text(ingredient.quantity)
                                .bold()
                            Text("- \(ingredient.name)")
                        }
                       
                    }
                }
                
                Section(header: Text("Step-by-step").font(.headline)) {
                    ForEach(Array(recipe.stepByStep.enumerated()), id: \.element) { index, step in
                        Text("\(index + 1). \(step)")
                    }
                }
            }
            .navigationTitle(recipe.title)
            
            Button {
                
            } label: {
                Text("Begin recipe")
                    .font(.title3)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }.padding()
        }
        
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(recipe: Recipe.sampleData[0])
    }
}

//
//  RecipePreviewView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 02/08/24.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe
    
    var timesDoneText: String {
        recipe.timesDone > 0 ? "Times done: \(recipe.timesDone)" : "not made yet"
    }
    
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Spacer()
                Text(timesDoneText)
                    .font(.footnote)
                    .padding(
                        .trailing)
            }
            HStack {
                Text(recipe.image)
                    .font(.largeTitle)
                VStack (alignment: .leading){
                    Text(recipe.title)
                        .font(.headline)
                    Text(recipe.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    RecipeRowView(recipe: Recipe.sampleData[0])
        .previewLayout(.fixed(width: 400, height: 60))
}

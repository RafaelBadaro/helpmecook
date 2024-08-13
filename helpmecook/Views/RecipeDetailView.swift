//
//  RecipeDetailView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 10/08/24.
//

import SwiftUI

struct RecipeDetailView: View {
    @StateObject var recipe: Recipe
    
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
                    ForEach(recipe.stepByStep.indices, id: \.self) { index in
                        Text("\(index + 1). \(recipe.stepByStep[index].title)")
                    }

                }
            }
            .navigationTitle(recipe.title)
            
            NavigationLink(destination: StepView(
                allSteps: recipe.stepByStep,
                indexOfCurrentStep: 0,
                currentStep: recipe.stepByStep[0])){
                    Text("Begin recipe")
                        .font(.title3)
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }.padding()
            
//            Button {
//                
//            } label: {
//                Text("Begin recipe")
//                    .font(.title3)
//                    .padding()
//                    .background(.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
            
        }
        
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(recipe: Recipe.sampleData[0])
    }
}

//
//  FinalStepView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 20/08/24.
//

import SwiftUI

struct RecipeCompletedView: View {
    // TODO - these:
    // Go back to root view
    // Set timesDone +=1
    // Clear all isChecked ?
    // Add here some confetti animation (or any animation)
    // Show times completed, like "this is your Xth time completing this" or you completed this recipe X times!"
    var recipe: Recipe
    var completionWords = ["Alright!", "Yummy!", "Nice!"]
    
    var body: some View {
        VStack {
            
            VStack{
                Text("Congratulations!")
                    .font(.title)
                    .padding(.bottom, 25)
                
                if recipe.timesDone == 0 {
                    Text("This is your first time completing the ")
                        .font(.title2)
                    
                    + Text(recipe.title)
                        .foregroundColor(.red)
                        .font(.title2)
                    
                    + Text(" recipe!")
                        .font(.title2)
                } else {
                    
                    if recipe.timesDone == 1 {
                        Text("You completed the ")
                            .font(.title2)
                        
                        + Text(recipe.title)
                            .foregroundColor(.red)
                            .font(.title2)
                        
                        + Text(" recipe ")
                            .font(.title2)
                        
                        + Text("once!")
                            .foregroundColor(.red)
                            .font(.title2)
                    } else {
                        Text("You completed the ")
                            .font(.title2)
                        
                        + Text(recipe.title)
                            .foregroundColor(.red)
                            .font(.title2)
                        
                        + Text(" recipe ")
                            .font(.title2)
                        
                        + Text("\(recipe.timesDone)")
                            .foregroundColor(.red)
                            .font(.title2)
                        
                        + Text(" times!")
                            .font(.title2)
                    }
                    
                }

            }
            .padding()
            
            
            Button {

            } label: {
                Text(selectRandomCompletionWord())
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue.opacity(0.5))
            .clipShape(Capsule())
        }
        .navigationBarBackButtonHidden(true)
     
    }
    
    func selectRandomCompletionWord() -> String{
        let rand = Int.random(in: 0..<completionWords.count)
        return completionWords[rand]
    }
}

#Preview {
    RecipeCompletedView(recipe: Recipe.sampleData[0])
}

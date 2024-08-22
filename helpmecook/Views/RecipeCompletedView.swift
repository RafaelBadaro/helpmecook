//
//  FinalStepView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 20/08/24.
//

import SwiftUI

struct RecipeCompletedView: View {
    //TODO - these:
    // Go back to root view
    // Set timesDone +=1
    // Clear all isChecked ?
    // Add here some confetti animation (or any animation)
    // Show times completed, like "this is your Xth time completing this" or you completed this recipe X times!"
    
    var completionWords = ["Alright!", "Yummy!", "Nice!"]
    var body: some View {
        VStack {
            Button {

            } label: {
                Text(selectRandomCompletionWord())
            }
        }
        .navigationBarBackButtonHidden(true)
     
    }
    
    func selectRandomCompletionWord() -> String{
        let rand = Int.random(in: 0..<completionWords.count)
        return completionWords[rand]
    }
}

#Preview {
    RecipeCompletedView()
}

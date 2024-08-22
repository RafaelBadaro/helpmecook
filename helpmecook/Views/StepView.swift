//
//  StepView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 12/08/24.
//

import SwiftUI

struct StepView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var recipe: Recipe
    var allSteps: [Step] {
        recipe.stepByStep
    }
    var indexOfCurrentStep: Int
    @ObservedObject var currentStep: Step
    
    var showBackButton: Bool {
        indexOfCurrentStep == 0 ? false : true
    }
    
    var indexOfNextStep: Int {
        let nextIndex =
        indexOfCurrentStep == allSteps.count-1 ? allSteps.count-1 : indexOfCurrentStep + 1
        return nextIndex
    }
    
    var indexOfPreviousStep: Int {
        let previousIndex =
        indexOfCurrentStep == 0 ? indexOfCurrentStep - 1 : 0
        return previousIndex
    }
    
    var body: some View {
        VStack {
            Text("Step \(indexOfCurrentStep + 1): \(currentStep.title)")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            VStack (alignment: .leading){
                Text("Instructions")
                    .font(.title)
                
                // TODO - animate when all toggles are checked
                ForEach($currentStep.instructions) { $instruction in
                    Button {
                        instruction.isChecked.toggle()
                    } label: {
                        Image(systemName: instruction.isChecked ? "checkmark.square" : "square")
                        Text(instruction.name)
                            .fontWeight(.bold)
                    }
                    .font(.title)
                }
                
            }
            .padding()
            
            Spacer()
            
            HStack {
                if indexOfCurrentStep != 0 {
                    Button {
                        dismiss()
                    } label: {
                        Text("Previous step")
                            .font(.title3)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                }
                
                // TODO - animate and change color slightly when all toggles are checked
                if indexOfCurrentStep != allSteps.count-1 {
                    NavigationLink(destination: StepView(
                        recipe: recipe,
                        indexOfCurrentStep: indexOfNextStep,
                        currentStep: allSteps[indexOfNextStep])){
                            Text("Next step")
                                .font(.title3)
                                .padding()
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }.padding()
                }
                
                if indexOfCurrentStep == allSteps.count-1 {
                    NavigationLink(destination: RecipeCompletedView()){
                            Text("Complete Recipe")
                                .font(.title3)
                                .padding()
                                .background(.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }.padding()
                }
                
            }
        }
        .navigationBarBackButtonHidden(showBackButton)
    }
}

#Preview {
    NavigationStack {
        StepView(
            recipe: Recipe.sampleData[0],
            indexOfCurrentStep: 0,
            currentStep: Step.chickenBreastSteps[0])
    }
}

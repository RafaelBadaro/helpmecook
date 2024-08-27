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
    
     var allInstructionsChecked: Bool {
        currentStep.instructions.allSatisfy(\.isChecked)
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
                    .fontWeight(.bold)
                    .foregroundColor(Color(
                        allInstructionsChecked ?
                            .green :
                            .black
                    ))
                
                ForEach($currentStep.instructions) { $instruction in
                    Button {
                        instruction.isChecked.toggle()
                    } label: {
                        Image(systemName: instruction.isChecked ? "checkmark.circle" : "circle")
                            .foregroundColor(Color(
                                allInstructionsChecked ?
                                    .green :
                                    .black
                            ))
                        Text(instruction.name)
                            .foregroundColor(Color(
                                allInstructionsChecked ?
                                    .green :
                                    .black
                            ))
                           
                    }
                    .font(.title)
                    .padding(3)
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
                
                if indexOfCurrentStep != allSteps.count-1 {
                    NavigationLink(destination: StepView(
                        recipe: recipe,
                        indexOfCurrentStep: indexOfNextStep,
                        currentStep: allSteps[indexOfNextStep])){
                            Text("Next step")
                                .font(.title3)
                                .padding()
                                .background(Color(
                                    allInstructionsChecked ?
                                        .green :
                                        .blue
                                ))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }.padding()
                }
                
                if indexOfCurrentStep == allSteps.count-1 {
                    NavigationLink(destination: RecipeCompletedView(recipe: recipe)){
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
        .background(.yellow.opacity(0.2))
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

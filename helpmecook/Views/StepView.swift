//
//  StepView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 12/08/24.
//

import SwiftUI

struct StepView: View {
    @Environment(\.dismiss) var dismiss
    // TODO - Review what variables I need for this
    
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
            
            // TODO: fix this instructions toggle
            // It does not get checked in the preview
            // its weird.
            VStack (alignment: .leading){
                Text("Instructions")
                    .font(.title)
                
                ForEach($currentStep.instructions) { $instruction in
                    Toggle(isOn: $instruction.isChecked){
                        Text(instruction.name)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
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
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }.padding()
                }
                
            }
        }
        .navigationBarBackButtonHidden(showBackButton)
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
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

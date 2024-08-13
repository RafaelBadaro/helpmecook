//
//  StepView.swift
//  helpmecook
//
//  Created by Rafael Badaró on 12/08/24.
//

import SwiftUI

struct StepView: View {
    let allSteps: [Step]
    var indexOfCurrentStep: Int
    @ObservedObject var currentStep: Step
    
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
                
                // TODO - fix this, isso ta criando toda hora uma view nova
                // toda hora o previous esta adicionando no topo da navegacao
                // uma nova view de StepView
                // descobrir como usar o dismiss
                if indexOfCurrentStep != 0 {
                    NavigationLink(destination: StepView(
                        allSteps: allSteps,
                        indexOfCurrentStep: indexOfPreviousStep,
                        currentStep: allSteps[indexOfPreviousStep])){
                        Text("Previous step")
                            .font(.title3)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }.padding()
                }
              
                if indexOfCurrentStep != allSteps.count-1 {
                    NavigationLink(destination: StepView(
                        allSteps: allSteps,
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
              
            }
            
        }
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
            allSteps: Step.chickenBreastSteps,
            indexOfCurrentStep: 0,
            currentStep: Step.chickenBreastSteps[0])
    }
}

//
//  Step.swift
//  helpmecook
//
//  Created by Rafael Badaró on 12/08/24.
//

import Foundation

class Step: Identifiable, ObservableObject {
    let id: UUID
    var title: String
    var note: String
    var instructions: [Instruction]
    
    init(id: UUID = UUID(), title: String, note: String, instructions: [Instruction]) {
        self.id = id
        self.title = title
        self.note = note
        self.instructions = instructions
    }
}

class Instruction: Identifiable {
    let id = UUID()
    let name: String
    var isChecked = false
    
    init(name: String, isChecked: Bool = false) {
        self.name = name
        self.isChecked = isChecked
    }
}

extension Step {
    static let chickenBreastSteps: [Step] = [
        Step(
            title: "Season the chicken breast with salt, pepper, and garlic.",
            note: "Ensure the seasoning is evenly spread.",
            instructions: [
                Instruction(name: "Season with salt"),
                Instruction(name: "Season with pepper"),
                Instruction(name: "Season with garlic")
            ]
        ),
        Step(
            title: "Heat the olive oil in a pan over medium heat.",
            note: "Make sure the oil is hot before adding the chicken.",
            instructions: [
                Instruction(name: "Add olive oil to pan"),
                Instruction(name: "Heat over medium heat")
            ]
        ),
        Step(
            title: "Cook the chicken breast for 5-7 minutes on each side until golden brown.",
            note: "Do not overcrowd the pan.",
            instructions: [
                Instruction(name: "Place chicken in pan"),
                Instruction(name: "Cook 5-7 minutes each side until golden brown")
            ]
        ),
        Step(
            title: "Squeeze lemon juice over the chicken before serving.",
            note: "Add the lemon juice just before serving for freshness.",
            instructions: [
                Instruction(name: "Squeeze lemon juice"),
                Instruction(name: "Serve")
            ]
        )
    ]
    
    static let spaghettiCarbonaraSteps: [Step] = [
        Step(title: "Cook the spaghetti according to package instructions.",
             note: "Ensure the spaghetti is al dente.",
             instructions: [Instruction(name: "Boil water"), Instruction(name: "Cook spaghetti")]),
        Step(title: "Fry the pancetta until crispy.",
             note: "Fry over medium heat until crispy.",
             instructions: [Instruction(name: "Fry pancetta until crispy")]),
        Step(title: "Whisk the eggs and parmesan cheese together in a bowl.",
             note: "Whisk until well combined.",
             instructions: [Instruction(name: "Whisk eggs"), Instruction(name: "Add parmesan cheese")]),
        Step(title: "Drain the spaghetti and return it to the pot.",
             note: "Do not rinse the spaghetti.",
             instructions: [Instruction(name: "Drain spaghetti"), Instruction(name: "Return to pot")]),
        Step(title: "Add the pancetta and egg mixture to the spaghetti and mix well.",
             note: "Mix quickly to avoid scrambling the eggs.",
             instructions: [Instruction(name: "Add pancetta"), Instruction(name: "Mix in egg mixture")]),
        Step(title: "Season with black pepper and salt to taste.",
             note: "Adjust seasoning to your preference.",
             instructions: [Instruction(name: "Season with black pepper"), Instruction(name: "Add salt to taste")])
    ]

    
    static let caesarSaladSteps: [Step] = [
        Step(title: "Chop the romaine lettuce into bite-sized pieces.",
             note: "Ensure the lettuce is clean and dry.",
             instructions: [Instruction(name: "Chop lettuce")]),
        Step(title: "Toss the lettuce with Caesar dressing.",
             note: "Coat the lettuce evenly with dressing.",
             instructions: [Instruction(name: "Toss lettuce"), Instruction(name: "Add Caesar dressing")]),
        Step(title: "Add croutons, parmesan cheese, and anchovies.",
             note: "Distribute the ingredients evenly.",
             instructions: [Instruction(name: "Add croutons"), Instruction(name: "Add parmesan cheese"), Instruction(name: "Add anchovies")]),
        Step(title: "Mix well and serve immediately.",
             note: "Serve right away for best texture.",
             instructions: [Instruction(name: "Mix well"), Instruction(name: "Serve immediately")])
    ]

    static let grilledRibeyeSteps: [Step] = [
        Step(title: "Season the ribeye steak with salt, pepper, and garlic powder.",
             note: "Season both sides evenly.",
             instructions: [Instruction(name: "Season with salt"), Instruction(name: "Season with pepper"), Instruction(name: "Season with garlic powder")]),
        Step(title: "Heat the olive oil in a grill pan over high heat.",
             note: "Ensure the oil is hot before adding the steak.",
             instructions: [Instruction(name: "Add olive oil to pan"), Instruction(name: "Heat over high heat")]),
        Step(title: "Grill the steak for 4-5 minutes on each side for medium-rare.",
             note: "Adjust cooking time for desired doneness.",
             instructions: [Instruction(name: "Place steak in pan"), Instruction(name: "Grill 4-5 minutes each side for medium-rare")]),
        Step(title: "Add the rosemary to the pan and baste the steak with the juices.",
             note: "Baste continuously for added flavor.",
             instructions: [Instruction(name: "Add rosemary"), Instruction(name: "Baste steak with juices")]),
        Step(title: "Let the steak rest for 5 minutes before slicing and serving.",
             note: "Resting allows juices to redistribute.",
             instructions: [Instruction(name: "Let steak rest 5 minutes"), Instruction(name: "Slice and serve")])
    ]
    
    static let tomatoSoupSteps: [Step] = [
        Step(title: "Chop the tomatoes, onion, and garlic.",
             note: "Chop ingredients into small pieces.",
             instructions: [Instruction(name: "Chop tomatoes"), Instruction(name: "Chop onion"), Instruction(name: "Chop garlic")]),
        Step(title: "Heat the olive oil in a pot and sauté the onion and garlic.",
             note: "Sauté until fragrant and translucent.",
             instructions: [Instruction(name: "Add olive oil to pot"), Instruction(name: "Sauté onion and garlic")]),
        Step(title: "Add the tomatoes and cook until soft.",
             note: "Cook tomatoes until they break down.",
             instructions: [Instruction(name: "Add tomatoes"), Instruction(name: "Cook until soft")]),
        Step(title: "Pour in the vegetable broth and simmer for 20 minutes.",
             note: "Simmer to blend flavors.",
             instructions: [Instruction(name: "Pour in vegetable broth"), Instruction(name: "Simmer for 20 minutes")]),
        Step(title: "Blend the soup until smooth and stir in the cream.",
             note: "Blend carefully to avoid splatters.",
             instructions: [Instruction(name: "Blend soup until smooth"), Instruction(name: "Stir in cream")]),
        Step(title: "Season with salt and pepper to taste before serving.",
             note: "Adjust seasoning as needed.",
             instructions: [Instruction(name: "Season with salt"), Instruction(name: "Season with pepper"), Instruction(name: "Serve")])
    ]


    static let chocolateCakeSteps: [Step] = [
        Step(title: "Preheat the oven to 175°C (350°F).",
             note: "Preheat the oven while preparing the batter.",
             instructions: [Instruction(name: "Preheat oven to 175°C (350°F)")]),
        Step(title: "Mix the dry ingredients together in a bowl.",
             note: "Ensure dry ingredients are well combined.",
             instructions: [Instruction(name: "Mix flour, sugar, cocoa powder, baking powder, baking soda, and salt")]),
        Step(title: "Add the eggs, milk, vegetable oil, and vanilla extract to the dry ingredients.",
             note: "Mix until smooth and well combined.",
             instructions: [Instruction(name: "Add eggs"), Instruction(name: "Add milk"), Instruction(name: "Add vegetable oil"), Instruction(name: "Add vanilla extract")]),
        Step(title: "Mix well and then slowly add the boiling water.",
             note: "Mix continuously while adding water.",
             instructions: [Instruction(name: "Mix well"), Instruction(name: "Slowly add boiling water")]),
        Step(title: "Pour the batter into a greased baking pan.",
             note: "Grease the pan thoroughly.",
             instructions: [Instruction(name: "Grease baking pan"), Instruction(name: "Pour batter into pan")]),
        Step(title: "Bake for 30-35 minutes or until a toothpick inserted into the center comes out clean.",
             note: "Check for doneness with a toothpick.",
             instructions: [Instruction(name: "Bake for 30-35 minutes"), Instruction(name: "Check with toothpick")]),
        Step(title: "Let the cake cool before serving.",
             note: "Allow cake to cool completely.",
             instructions: [Instruction(name: "Let cake cool"), Instruction(name: "Serve")])
    ]

    
}

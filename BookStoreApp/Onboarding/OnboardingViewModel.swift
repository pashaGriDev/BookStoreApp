//
//  OnboardingViewModel.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 13.12.23.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var source = OnboardingStep.createSteps()
    @Published var currentStep: Int = 0
    
    var bottomButtonTitle: String {
        currentStep < source.count - 1
             ? "Далее"
             : "Начать чтение"
    }
    
    func skipHandler() {
        currentStep = source.count - 1
    }
    
    func stepHandler() {
        if currentStep < source.count - 1 {
            self.currentStep += 1
        } else {
            // Get Started Logic
        }
    }
    
}


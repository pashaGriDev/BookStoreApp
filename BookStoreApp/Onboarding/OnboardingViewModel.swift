//
//  OnboardingViewModel.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 13.12.23.
//

import Foundation
import SwiftUI

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
    
    func stepHandler() -> Bool {
        if currentStep < source.count - 1 {
            self.currentStep += 1
            return false
        } else {
            return true
        }
    }
}


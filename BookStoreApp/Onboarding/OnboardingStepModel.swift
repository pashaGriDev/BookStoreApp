//
//  OnboardingStepModel.swift
//  BookStoreApp
//
//  Created by Павел Грицков on 13.12.23.
//

import Foundation

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
}

extension OnboardingStep {
    static func createSteps() -> [OnboardingStep] {
        [
            OnboardingStep(
                image: "on1",
                title: "",
                description: "Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!"
            ),
            OnboardingStep(
                image: "on2",
                title: "",
                description: "Описание 2"
            ),
            OnboardingStep(
                image: "on3",
                title: "",
                description: "Описание 3"
            )
        ]
    }
}

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
                image: "onboarding1",
                title: "Welcome!",
                description: "Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!"
            ),
            OnboardingStep(
                image: "onboarding2",
                title: "Read what you really like",
                description: "In our app you can find for yourself real hidden diamonds, you should only pay attention to user rating of books. Don't forget to use the search bar!"
            ),
            OnboardingStep(
                image: "category_4",
                title: "Add in your favorites",
                description: "Read it and forgot it? No, add your favorite books to your favorites and come back whenever you want!"
            )
        ]
    }
}

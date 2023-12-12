//
//  Onboarding.swift
//  BookStoreApp
//
//  Created by Михаил Данилин on 12.12.2023.
//

import SwiftUI

struct OnBoardingStep{
    let image: String
    let title: String
    let description: String
}

extension OnBoardingStep {
    static func getMocData() -> [OnBoardingStep] {
        [
            OnBoardingStep(image: "on1", title: "", description: "Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!"),
            OnBoardingStep(image: "on2", title: "", description: "Описание 2"),
            OnBoardingStep(image: "on3", title: "", description: "Описание 3")
        ]
    }
}

struct OnboardingView: View {
    @State private var currentStep: Int = 0
    
    private var stepCount: Int {
        source.count
    }
    struct Drawing {
        static let logoImage = "logo"
        static let buttonSkip = "Пропустить"
    }
    
    private var boomButton: String {
        currentStep < source.count - 1
             ? "Далее"
             : "Начать чтение"
    }
    
    
    private let source: [OnBoardingStep] = OnBoardingStep.getMocData()

    
    
    // MARK: - init(_:)
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.currentStep = source.count - 1
                    }) {
                        Text(Drawing.buttonSkip)
                            .padding(16)
                            .foregroundColor(.gray)
                    }
                }
                
                TabView(selection: $currentStep) {
                    ForEach(source.indices, id: \.self) { it in
                        VStack {
                            Image(source[it].image)
                                .resizable()
                                .frame(width: 350, height: 350)
                            
                            Text(source[it].title)
                                .font(.title)
                                .bold()
                            
                            Text(source[it].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(source.indices, id: \.self) { it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.bottom, 24)
                
                Button(action: {
                    if self.currentStep < source.count - 1 {
                        self.currentStep += 1
                    } else {
                        // Get Started Logic
                    }
                }) {
                    Text(boomButton)
                    
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(5)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            // Логотип посередине экрана
            VStack {
                Spacer()
                Image(Drawing.logoImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100) // Размер логотипа
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#Preview {
    OnboardingView()
}

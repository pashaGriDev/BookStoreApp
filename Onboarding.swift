//
//  Onboarding.swift
//  BookStoreApp
//
//  Created by Михаил Данилин on 12.12.2023.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingSteps = [
    OnBoardingStep(image: "on1", title: "", description: "Read more and stress less with our online book shopping app. Shop from anywhere you are and discover titles that you love. Happy reading!"),
    OnBoardingStep(image: "on2", title: "", description: "Описание 2"),
    OnBoardingStep(image: "on3", title: "", description: "Описание 3")
]

struct ContentView: View {
    @State private var currentStep = 0
    let logoImage = "logo"
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.currentStep = onBoardingSteps.count - 1
                    }) {
                        Text("Пропустить")
                            .padding(16)
                            .foregroundColor(.gray)
                    }
                }
                
                TabView(selection: $currentStep) {
                    ForEach(0..<onBoardingSteps.count) { it in
                        VStack {
                            Image(onBoardingSteps[it].image)
                                .resizable()
                                .frame(width: 350, height: 350)
                            
                            Text(onBoardingSteps[it].title)
                                .font(.title)
                                .bold()
                            
                            Text(onBoardingSteps[it].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(0..<onBoardingSteps.count) { it in
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
                    if self.currentStep < onBoardingSteps.count - 1 {
                        self.currentStep += 1
                    } else {
                        // Get Started Logic
                    }
                }) {
                    Text(currentStep < onBoardingSteps.count - 1 ? "Далее" : "Начать чтение")
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
                Image(logoImage)
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
    ContentView()
}

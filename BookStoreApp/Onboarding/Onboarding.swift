//
//  Onboarding.swift
//  BookStoreApp
//
//  Created by Михаил Данилин on 12.12.2023.
//

import SwiftUI

struct OnboardingView: View {
    struct Drawing {
        static let logoImage = "logo"
        static let buttonSkip = "Skip"
    }
    
    @Binding var isOnboarding: Bool
    @ObservedObject var vm = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        vm.skipHandler()
                        isOnboarding.toggle()
                    }) {
                        Text(Drawing.buttonSkip)
                            .padding(16)
                            .foregroundColor(.gray)
                    }
                }
                
                TabView(selection: $vm.currentStep) {
                    ForEach(vm.source.indices, id: \.self) { it in
                        VStack {
                            Image(vm.source[it].image)
                                .resizable()
                                .scaledToFill()
                                .opacity(0.8)
                                .clipShape(Circle())
                                .frame(width: 350, height: 350)
                            
                            Text(vm.source[it].title)
                                .font(.title)
                                .bold()
                            
                            Text(vm.source[it].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.top, 16)
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(vm.source.indices, id: \.self) { it in
                        if it == vm.currentStep {
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
                
                Button {
                    withAnimation {
                        if vm.stepHandler() {
                            isOnboarding.toggle()
                        }
                    }
                } label: {
                    Text(vm.bottomButtonTitle)
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
    
    // MARK: - init(_:)
    init(
        _ isOnboarding: Binding<Bool>
    ) {
        _isOnboarding = isOnboarding
        UIScrollView.appearance().bounces = false
    }
}


#Preview {
    OnboardingView(.constant(true))
}

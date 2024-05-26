//
//  Onboarding1.swift
//  STOD
//
//  Created by hannback on 5/20/24.
//

import SwiftUI
import Lottie

struct OnboardingCard: View {
    let title: String
    let lottie: String
    let spacing: CGFloat? = 20
    
    var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            Text(title)
                .font(.StodHeadline)
                .fixedSize()
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 48, leading: 16, bottom: 0, trailing: 16))
            
            LottieView(animation: .named(lottie))
                .looping()
                .animationSpeed(2)
                .resizable()
                .scaledToFill()
                .shadow(radius: 20)
                .frame(height: 460)
        }
    }
}

#Preview {
    OnboardingCard(title: "작은 화면 모드로 간편하게 \n옷 수치를 비교하세요.", lottie: "ONBOARDING01.lottie")
}

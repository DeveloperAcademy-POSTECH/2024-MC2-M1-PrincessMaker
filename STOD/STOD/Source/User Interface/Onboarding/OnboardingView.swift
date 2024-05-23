//
//  OnboardingView.swift
//  STOD
//
//  Created by hannback on 5/19/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var tabSelection: Int = 0
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack {
                    TabView(selection: $tabSelection)  {
                        ForEach(0..<3) { num in
                            if num == 0 {
                                ZStack {
                                    Image("Onboarding_S")
                                        .rotationEffect(Angle(degrees: -8.3))
                                        .offset(x:-130, y:170)
                                    OnboardingCard(title: "작은 화면 모드로 간편하게 \n옷 수치를 비교하세요.",
                                                   lottie: "ONBOARDING01.lottie")
                                }
                            }
                            else if num == 1{
                                ZStack{
                                    Image("Onboarding_T")
                                        .offset(x:-130, y:200)
                                    Image("Onboarding_O")
                                        .offset(x:130, y:70)
                                    
                                    OnboardingCard(title: "아래로 끌어당겨 \n새로운 옷 정보 등록하세요.",
                                                   lottie: "ONBOARDING02.lottie")
                                }
                            }
                            else if num == 2{
                                ZStack {
                                    Image("Onboarding_D")
                                        .offset(x:135, y:50)
                                    OnboardingCard(title: "등록한 옷 정보를 \n쉽게 편집하세요.",
                                                   lottie: "ONBOARDING03.lottie")
                                }
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    IndicatorView(tabSelection: $tabSelection)
                    
                    OnboardingButton(isSet: $tabSelection, isPresented: $isPresented)
                    
                }
                .background(Color(hex: "#363636"))
            }
            .navigationDestination(isPresented: $isPresented) {
                ContentView()
            }
        }
    }
}

//#Preview {
//    OnboardingView()
//}

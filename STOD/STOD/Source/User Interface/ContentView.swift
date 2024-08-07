//
//  ContentView.swift
//  STOD
//
//  Created by 이윤학 on 5/23/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    @State var isLoading: Bool = true
    
    var body: some View {
        if isLoading {
            LaunchScreen()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                        withAnimation {
                            isLoading = false
                        }
                    }
                }
        } else {
            if firstLaunch {
                OnboardingView()
            } else {
                Home()
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  OnboardingButton.swift
//  STOD
//
//  Created by hannback on 5/20/24.
//

import SwiftUI

struct OnboardingButton: View {
    
    @Binding var tabSelection: Int
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    
    var body: some View {
        Button {
            print("Button is clicked")
            firstLaunch = false
        } label: {
            HStack {
                Spacer()
                Text("시작하기")
                    .font(.StodTitle1)
                    .foregroundStyle(.black)
                Spacer()
            }
            
        }
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(tabSelection == 2 ? .accentColor : .stodGray100)
                .frame(height: 50)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 30, trailing: 16))
        .disabled(tabSelection != 2)
    }
}


//#Preview {
//    OnboardingButton()
//}

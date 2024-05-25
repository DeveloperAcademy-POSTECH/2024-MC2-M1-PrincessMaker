//
//  OnboardingButton.swift
//  STOD
//
//  Created by hannback on 5/20/24.
//

import SwiftUI

struct OnboardingButton: View {
    
    @Binding var isSet: Int
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
                .foregroundColor(isSet == 2 ? .accentColor : .stodGray100)
                .frame(height: 50)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 30, trailing: 16))
        .disabled(isSet != 2)
    }
}


//#Preview {
//    OnboardingButton()
//}

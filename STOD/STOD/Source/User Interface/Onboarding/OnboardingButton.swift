//
//  OnboardingButton.swift
//  STOD
//
//  Created by hannback on 5/20/24.
//

import SwiftUI

struct OnboardingButton: View {
    
    @Binding var isSet: Int
    @Binding var isPresented: Bool
    
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    
    var body: some View {
        HStack(spacing: 6){
            //            ForEach(0..<3) { i in
            //                Image(systemName: "circle.fill")
            //                    .font(.system(size:9))
            //                    .padding(EdgeInsets(top: 24, leading: 0, bottom: 74, trailing: 0))
            //
            //            }
        }
            
        Button {
            print("Button is clicked")
            isPresented = true
            firstLaunch = false
            
        } label: {
            HStack {
                Spacer()
                Text("시작하기")
                    .font(.StodTitle1)
                //얘 왜 세미 볼드 안되지.. (왜?)
                    .foregroundStyle(.black)
                Spacer()
            }
            
        }
        .background( RoundedRectangle(cornerRadius: 10)
            .foregroundColor(isSet == 2 ? .accentColor : .stodGray100)
            .frame(height: 50)
        )
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 30, trailing: 16))
        .disabled(isSet != 2)
    }
}


//#Preview {
//    OnboardingButton()
//}

//
//  RegisterNextButton.swift
//  STOD
//
//  Created by 이윤학 on 5/25/24.
//

import SwiftUI

struct RegisterNextButton: View {
    let isAvailable: Bool
    @Binding var registerState: Int
    
    var body: some View {
        Button {
            registerState += 1
        } label: {
            HStack {
                Spacer()
                Text("확인")
                    .font(.StodTitle1)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.vertical, 15)
            .background {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(isAvailable ? .accent : .stodGray100)
            }
            
        }
        .disabled(!isAvailable)
    }
}

#Preview {
    RegisterNextButton(isAvailable: true, registerState: .constant(1))
}

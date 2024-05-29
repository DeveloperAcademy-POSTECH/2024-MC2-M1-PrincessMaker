//
//  PIPSection.swift
//  STOD
//
//  Created by 이윤학 on 5/20/24.
//

import SwiftUI

struct PIPSection: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.stodBlack)
                .overlay {
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(Color.stodWhite.opacity(0.3), lineWidth: 1.0)
                }
                
            VStack(spacing: 12) {
                Image(.characterHome)
                Text("선택한 옷이 뜨는 곳이에요")
                    .font(.StodTitle1)
                    .foregroundStyle(.stodGray100)
            }
        }
        .padding(.horizontal, 16)
        .frame(height: (UIScreen.main.bounds.width-32)/16*9)
    }
}

#Preview {
    PIPSection()
}

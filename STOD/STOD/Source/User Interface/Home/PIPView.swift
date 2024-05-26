//
//  PIPView.swift
//  STOD
//
//  Created by 이윤학 on 5/26/24.
//

import SwiftUI

struct PIPView: View {
    @Binding var selectedCloth: Cloth?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let uiImage = selectedCloth?.numericalUIImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            } else {
                Image(.colorCharacter)
                    .resizable()
                    .scaledToFit()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            HStack(alignment: .bottom) {
                Text(selectedCloth?.size ?? "")
                    .font(Font.custom("Pretendard-Bold", size: 40))
                    .foregroundStyle(.stodWhite)
                    .padding(25)
                    .background(.stodGray200.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
                Spacer()
                Text("STOD")
                    .font(Font.custom("Pretendard-Bold", size: 30))
                    .foregroundStyle(.stodBlack)
            }
            .padding(36)
        }
        .frame(width: (UIScreen.main.bounds.width)*3 )
    }
}

#Preview {
    PIPView(selectedCloth: .constant(Cloth(size: "Large", numericalImageData: UIImage(resource: .onboardingT).pngData())))
}

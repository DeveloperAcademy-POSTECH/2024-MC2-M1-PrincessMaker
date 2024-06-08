//
//  ProgressBar.swift
//  STOD
//
//  Created by kim kanghyeok on 6/7/24.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progressStage: Int
    @State private var progressSet: [String] = ["ProgressOne", "ProgressTwo", "ProgressThree", "ProgressFour"]
    @State private var progressText: [String] = ["옷 이름", "사이즈", "옷 종류", "사진 등록"]
    
    var body: some View {
        VStack {
            Image(progressSet[progressStage])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 335, height: 15)
                .padding(EdgeInsets(top: 24, leading: 0, bottom: 12, trailing: 0))
            HStack {
                ForEach(0..<progressText.count) { stage in
                    Spacer()
                    Text(progressText[stage])
                        .font(.StodBody)
                        .foregroundStyle(progressStage == stage ? Color(hex:"#FFFFFF") : Color(hex: "#2B2B2B"))
                        .frame(minWidth: 91, minHeight: 17)
                    Spacer()
                }
            }
        }
    }
}

//#Preview {
//    ProgressBar()
//}

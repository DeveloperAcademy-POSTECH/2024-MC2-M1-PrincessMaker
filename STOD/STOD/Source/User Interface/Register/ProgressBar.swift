//
//  ProgressBarTest.swift
//  STOD
//
//  Created by kim kanghyeok on 6/8/24.
//

import SwiftUI

struct ProgressBar: View {
    
    @State private var progressText: [String] = ["옷 이름", "사이즈", "옷 종류", "사진 등록"]
    @Binding var progressStage: Int
    
    var body: some View {
        VStack {
            
            HStack(spacing: 0) {
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(.accent)
                    .overlay(progressStage == 0 ? Circle().frame(width: 14, height: 14).foregroundStyle(.accent).opacity(0.5) : nil)
                
                ForEach(1..<progressText.count) { stage in
                    Rectangle()
                        .frame(width: 100, height: 1)
                        .foregroundStyle(progressStage >= stage ? .accent : Color(hex: "#2B2B2B"))
                    VStack {
                        Circle()
                            .frame(width: 9, height: 9)
                            .foregroundStyle(progressStage >= stage ? .accent : Color(hex:"#2B2B2B"))
                            .overlay(progressStage <= stage ? Circle().frame(width:14, height: 14).foregroundStyle(progressStage == stage ? .accent : Color(hex: "#2B2B2B")).opacity(progressStage == stage ? 0.5 : 1) : nil)
                    }
                }
            }
            .padding(EdgeInsets(top: 24, leading: 0, bottom: 12, trailing: 0))
            
            HStack(spacing: 55) {
                Text(progressText[0])
                    .font(.StodBody)
                    .frame(width: 40)
                Text(progressText[1])
                    .font(.StodBody)
                    .frame(width:37)
                    .padding(.leading, 15)
                Text(progressText[2])
                    .font(.StodBody)
                    .frame(width: 40)
                    .padding(.leading)
                Text(progressText[3])
                    .font(.StodBody)
                    .frame(width: 52)
            }
        }
    }
}

//#Preview {
//    ProgressBarTest()
//}

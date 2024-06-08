//
//  CategorySection.swift
//  STOD
//
//  Created by 이윤학 on 5/20/24.
//

import SwiftUI

struct CategorySection: View {
    @Binding var selectedCategory: MainCategory
    let isOnlyTap: Bool
    let config = ScrollTapWheelPicker.Config.init()
    
    var body: some View {
        if isOnlyTap {
            VStack(alignment: .leading) {
                Text("어떤 옷을 찾고 계신가요?")
                    .font(.StodHeadline)
                    .padding(.horizontal, 16)
                Image(.categoryRuler)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 20)
                //GeometryReader { outerGeometry in // 추후.. 위치 추적해서 카테고리 선택할 수 있을까..?
                
                TapOnlyWheelPicker(selectedCategory: $selectedCategory)
                
                
            }
            
        } else {
            VStack(alignment: .leading) {
                Text("어떤 옷을 찾고 계신가요?")
                    .font(.StodHeadline)
                    .padding(.horizontal, 16)
                ScrollTapWheelPicker(config: config, selectedCategory: $selectedCategory)
                    .frame(height: 96, alignment: .top)
            }
        }   
    }
}

#Preview {
    CategorySection(selectedCategory: .constant(.recent), isOnlyTap: true)
}



//
//  CategorySection.swift
//  STOD
//
//  Created by 이윤학 on 5/20/24.
//

import SwiftUI

struct CategorySection: View {
    @State private var selectedCategory: MainCategory? = .recent
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("어떤 옷을 찾고 계신가요?")
                .font(.StodHeadline)
                .padding(.horizontal, 16)
            Image(.categoryRuler)
                .resizable()
                .scaledToFill()
                .frame(height: 20)
            //GeometryReader { outerGeometry in // 추후.. 위치 추적해서 카테고리 선택할 수 있을까..?
            
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { value in // ScrollViewReader 사용
                    HStack(spacing: 20) {
                        Rectangle()
                            .frame(width: 155, height: 5)
                            .foregroundStyle(.clear)
                        ForEach(MainCategory.allCases, id: \.self) { category in
                            CategoryButton(selectedCategory: $selectedCategory, category: category)
                                .id(category) // ForEach 내부의 각 항목에 고유한 ID 할당
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                        Rectangle()
                            .frame(width: 155, height: 5)
                            .foregroundStyle(.clear)
                    }
                    
                    .onAppear {
                        withAnimation {
                            value.scrollTo(selectedCategory, anchor: .center)
                        }
                    }
                    .onChange(of: selectedCategory) { oldValue, newValue in
                        withAnimation {
                            value.scrollTo(newValue, anchor: .center)
                            // 선택된 카테고리로 스크롤
                        }
                    }
                }
            }
            .frame(height: 80)
        }
    }
}

#Preview {
    CategorySection()
}

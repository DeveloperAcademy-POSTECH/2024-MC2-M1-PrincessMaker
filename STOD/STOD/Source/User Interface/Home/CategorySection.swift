//
//  CategorySection.swift
//  STOD
//
//  Created by 이윤학 on 5/20/24.
//

import SwiftUI

struct CategorySection: View {
    @Binding var selectedCategory: MainCategory?
    
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
                        let oldIndex = MainCategory.allCases.firstIndex(of: oldValue ?? .recent) ?? 0
                        
                        let newIndex = MainCategory.allCases.firstIndex(of: newValue ?? .accessory) ?? 4
                        
                        let duration = Double(abs(newIndex - oldIndex))*0.2
                        
                        withAnimation(.easeInOut(duration: duration)) {
                            // 선택된 카테고리로 스크롤
                            value.scrollTo(newValue, anchor: .center)
                            
                            let count = abs(newIndex - oldIndex)
                            for i in 0..<count {
                                DispatchQueue.main.asyncAfter(deadline: .now() + (0.1 * Double(i))) {
                                    HapticManager.instance.impact(style: .rigid)
                                }
                            }
                            
                        }
                        
                    }
                }
            }
            //.scrollDisabled(true)
            .frame(height: 80)
        }
    }
}

#Preview {
    CategorySection(selectedCategory: .constant(.recent))
}



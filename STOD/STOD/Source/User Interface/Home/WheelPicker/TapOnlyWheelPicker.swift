//
//  TapOnlyWheelPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/22/24.
//

import SwiftUI

struct TapOnlyWheelPicker: View {
    @Binding var selectedCategory: MainCategory
    
    var body: some View {
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

#Preview {
    TapOnlyWheelPicker(selectedCategory: .constant(.recent))
}

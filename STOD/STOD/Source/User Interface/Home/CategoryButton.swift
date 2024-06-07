//
//  CategoryButton.swift
//  STOD
//
//  Created by 이윤학 on 5/20/24.
//

import SwiftUI

struct CategoryButton: View {
    @Binding var selectedCategory: MainCategory
    let category: MainCategory
    
    var isSelected: Bool {
        return selectedCategory == category
    }
    
    var localizedMainCategory: LocalizedStringKey {
        if selectedCategory != nil {
            return LocalizedStringKey(category.rawValue)
        }
        else {
            // 선택된 카테고리가 없는 경우 처리
            return LocalizedStringKey("최근")
        }
    }
    
    var body: some View {
        VStack(spacing: 4) {
            category.circleImage
                .resizable()
                .scaledToFill()
                .overlay {
                    Circle()
                        .stroke(isSelected ? Color.accentColor :
                                    Color.stodWhite,
                                lineWidth: isSelected ? 2.0 :
                                    1.0)
                }
                .padding(2)
                .frame(width: 48, height: 48)
            Text(localizedMainCategory)
                .font(.StodBody)
                .fixedSize()
                .foregroundStyle(.white)
        }
        .opacity(isSelected ? 1 : 0.6)
    }
}

#Preview {
    CategoryButton(selectedCategory: .constant(.top), category: .top)
}

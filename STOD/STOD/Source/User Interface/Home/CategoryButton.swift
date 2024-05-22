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
    
    var body: some View {
        VStack(spacing: 4) {
            category.image
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
            Text(category.rawValue)
                .font(.StodBody)
                .fixedSize()
        }
        .opacity(isSelected ? 1 : 0.6)
    }
}

#Preview {
    CategoryButton(selectedCategory: .constant(.top), category: .top)
}

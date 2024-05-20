//
//  CategoryButton.swift
//  STOD
//
//  Created by 이윤학 on 5/20/24.
//

import SwiftUI

struct CategoryButton: View {
    @State var isSelected = true
    let category: MainCategory
    
    var body: some View {
        VStack(spacing: 4) {
            category.image
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(isSelected ? Color.accentColor :
                                    Color.stodWhite,
                                lineWidth: isSelected ? 2.0 :
                                    1.0)
                }
            
            Text(category.rawValue)
                .font(.StodBody)
        }
        .opacity(isSelected ? 1 : 0.6)
    }
}

#Preview {
    CategoryButton(category: .top)
}

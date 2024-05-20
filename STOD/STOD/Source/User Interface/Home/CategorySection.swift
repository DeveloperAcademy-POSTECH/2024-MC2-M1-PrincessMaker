//
//  CategorySection.swift
//  STOD
//
//  Created by 이윤학 on 5/20/24.
//

import SwiftUI

struct CategorySection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("어떤 옷을 찾고 계신가요?")
                .font(.StodHeadline)
                .padding(.horizontal, 16)
            Image(.categoryRuler)
                .resizable()
                .scaledToFill()
                .frame(height: 20)
        }
        ScrollView(.horizontal) {
            HStack {
                ForEach(MainCategory.allCases, id: \.self) { category in
                    CategoryButton(category: category)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CategorySection()
}

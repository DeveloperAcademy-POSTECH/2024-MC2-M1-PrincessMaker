//
//  Home.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI

struct Home: View {
    @State private var selectedCategory: MainCategory = .recent
    @State private var clothes: [Cloth] = Cloth.dummy
    
    var body: some View {
        VStack(spacing: 24) {
            PIPSection()
            CategorySection(selectedCategory: $selectedCategory, isOnlyTap: false)
            ClothListPageView(selectedCategory: $selectedCategory, clothes: $clothes)
        }
    }
}

#Preview {
    Home()
}

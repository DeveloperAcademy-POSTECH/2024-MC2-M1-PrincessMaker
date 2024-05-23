//
//  ClothListPageView.swift
//  STOD
//
//  Created by 이윤학 on 5/23/24.
//

import SwiftUI

struct ClothListPageView: View {
    @Binding var selectedCategory: MainCategory
    @State private var isSearching: Bool = false
    @Binding var clothes: [Cloth]
    
    var body: some View {
        TabView(selection: $selectedCategory) {
            ForEach(MainCategory.allCases, id: \.self) { category in
                ClothList(selectedCategory: category, clothes: $clothes)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .gesture(DragGesture())
            }
        }
        //.animation(.snappy, value: selectedCategory)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    ClothListPageView(selectedCategory: .constant(.recent), clothes: .constant(Cloth.dummy))
}

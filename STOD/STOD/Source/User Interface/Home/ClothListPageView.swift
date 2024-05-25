//
//  ClothListPageView.swift
//  STOD
//
//  Created by 이윤학 on 5/23/24.
//

import SwiftUI
import SwiftData

struct ClothListPageView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var clothes: [Cloth]
    @Binding var showRegisterView: Bool
    @Binding var selectedCategory: MainCategory
    @Binding var selectedCloth: Cloth?
    
    var body: some View {
        TabView(selection: $selectedCategory) {
            ForEach(MainCategory.allCases, id: \.self) { category in
                ClothList(selectedCategory: category,
                          showRegisterView: $showRegisterView,
                          selectedCloth: $selectedCloth)
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
    ClothListPageView(showRegisterView: .constant(false), selectedCategory: .constant(.accessory), selectedCloth: .constant(SampleCloth.contents[0]))
}

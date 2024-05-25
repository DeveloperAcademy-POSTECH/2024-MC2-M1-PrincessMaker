//
//  Home.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI
import SwiftData

struct Home: View {
    @Environment(\.modelContext) private var modelContext
    @Query var clothes: [Cloth]
    
    @State private var selectedCategory: MainCategory = .recent
    @State private var showRegisterView: Bool = false
    @State private var selectedCloth: Cloth? = nil
    
    var body: some View {
        VStack(spacing: 24) {
            PIPSection()
            CategorySection(selectedCategory: $selectedCategory,
                            isOnlyTap: false)
            ClothListPageView(showRegisterView: $showRegisterView,
                              selectedCategory: $selectedCategory,
                              selectedCloth: $selectedCloth)
        }
        .fullScreenCover(isPresented: $showRegisterView) {
            Register()
        }
    }
}

#Preview {
    Home()
}

//SwiftData 프리뷰
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Cloth.self, configurations: config)

    for i in 1..<10 {
        let cloth = Cloth(name: "Helllo", size: "S", numericalImageData: nil, clothImageData: nil, subCategory: "후드티", mainCategory: "상의", isPinned: false)
        container.mainContext.insert(cloth)
    }

    return Home()
        .modelContainer(container)
}

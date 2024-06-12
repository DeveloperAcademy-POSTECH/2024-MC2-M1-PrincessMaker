//
//  Home.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI
import SwiftData
import UIPiPView

struct Home: View {
    @Environment(\.modelContext) private var modelContext
    @Query var clothes: [Cloth]
    
    @AppStorage("firstPIP") var firstPIP: Bool = true
    @State private var selectedCategory: MainCategory = .recent
    @State var showRegisterView: Bool = false
    @State private var selectedCloth: Cloth? = nil
    @State private var showPIP: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            UIPIPView(showPipView: $showPIP,
                      selectedCloth: $selectedCloth,
                      showRegisterView: $showRegisterView)
                .frame(width: UIScreen.main.bounds.width-32, height: (UIScreen.main.bounds.width-32)/4*3)
            Color.black
                .frame(width: UIScreen.main.bounds.width, height: 600)
            VStack(spacing: 0) {
                PIPSection()
                Spacer().frame(height: 24)
                CategorySection(selectedCategory: $selectedCategory,
                                isOnlyTap: false)
                Spacer().frame(height: 15)
                ClothList(selectedCategory: $selectedCategory,
                          showRegisterView: $showRegisterView,
                          selectedCloth: $selectedCloth,
                          showPIP: $showPIP)
                
            }
            
            if firstPIP && (selectedCloth != nil) {
                Color.black
                    .opacity(0.6)
                    .ignoresSafeArea()
                // 팝업뷰 들어올 자리
            }
        }
        .fullScreenCover(isPresented: $showRegisterView) {
            RegisterMainCategory()
        }
        .onChange(of: showPIP) { oldValue, newValue in
            print(showPIP)
        }
    }
}

#Preview {
    Home()
}

//SwiftData 프리뷰
//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Cloth.self, configurations: config)
//    
//    for i in 1..<10 {
//        let cloth = Cloth(name: "Helllo", size: "S", numericalImageData: nil, clothImageData: nil, subCategory: "후드티", mainCategory: "상의", isPinned: false)
//        container.mainContext.insert(cloth)
//    }
//    
//    return Home()
//        .modelContainer(container)
//}

//
//  Home.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI
import SwiftData
import Pipify
import UIPiPView

struct Home: View {
    @Environment(\.modelContext) private var modelContext
    @Query var clothes: [Cloth]
    
    @State private var selectedCategory: MainCategory = .recent
    @State var showRegisterView: Bool = false
    @State private var selectedCloth: Cloth? = nil
    @State private var showPIP: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            PIPViewRepresentable(showPipView: $showPIP, selectedCloth: $selectedCloth)
                .frame(width: UIScreen.main.bounds.width-32, height: (UIScreen.main.bounds.width-32)/16*9)
            Color.black
                .frame(width: .infinity, height: 600)
            VStack(spacing: 24) {
                PIPSection()
                CategorySection(selectedCategory: $selectedCategory,
                                isOnlyTap: false)
                ClothList(selectedCategory: $selectedCategory, showRegisterView: $showRegisterView, selectedCloth: $selectedCloth, showPIP: $showPIP)
                
            }
        }
        //.animation(.snappy(duration: 0.15), value: selectedCategory)
        .fullScreenCover(isPresented: $showRegisterView) {
            RegisterMainCategory()
        }
        .onChange(of: showPIP) { oldValue, newValue in
            print(showPIP)
        }
    }
    
    //        .pipify(isPresented: $showPIP) {
    //            PIPView(selectedCloth: $selectedCloth)
    //        }
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

extension Home {
    
    //    var PIPView: some View {
    //        ZStack {
    //            if let uiimage = selectedCloth?.numericalUIImage {
    //                 ZStack(alignment: .bottom) {
    //                    Image(uiImage: uiimage)
    //
    //                    HStack {
    //                        Text(selectedCloth?.size ?? "")
    //
    //                        Spacer()
    //
    //                        Image(.characterHome)
    //                            .resizable()
    //                            .scaledToFit()
    //                            .frame(width: 30)
    //                    }
    //                    .padding()
    //                }
    //
    //            } else {
    //                 Image(.characterHome)
    //            }
    //        }
    //    }
}

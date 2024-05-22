//
//  FirstSubmit.swift
//  STOD
//
//  Created by 김이예은 on 5/19/24.
//

import SwiftUI
import SwiftData

struct Register: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var newCloth: Cloth
    @State private var selectedMainCategory: MainCategory?
    @State private var selectedSubCategory: String?
//    @State private var isNavigationActive = false
    
    
    private func saveCloth() {
        modelContext.insert(newCloth)
        newCloth = Cloth(name: "", size: "", numericalPhotoData: nil, mainPhotoData: nil, selectedSubCategory: "", selectedMainCategory: "", numericalUIImage: nil, mainUIImage: nil)
        dismiss()
    }
    
    var body: some View {
        VStack {
            Text("옷의 카테고리를 선택해주세요")
            ForEach(MainCategory.allCases, id: \.self) { category in
                Button(action: {
                    selectedMainCategory = category
                    selectedSubCategory = category.rawValue
                }) {
                    Text(category.rawValue)
                        .foregroundColor(selectedMainCategory == category ? .yellow : .primary)
                }
            }
            
            Text("It's a third page")
            Text("옷 종류를 알려주세요")
            
            if let selectedMainCategory = selectedMainCategory {
                ForEach(selectedMainCategory.subcategories, id: \.self) { subcategory in
                    Button(action: {
                        selectedSubCategory = subcategory
                        newCloth.selectedSubCategory = subcategory
                        newCloth.selectedMainCategory = selectedMainCategory.rawValue
                    }) {
                        Text(subcategory)
                            .foregroundColor(selectedSubCategory == subcategory ? .yellow : .primary)
                    }
                }
            }
            
            Text("옷 이름을 알려주세요").font(.title3)
            TextField("", text: $newCloth.name)
            Text("어떤 사이즈를 구매하셨나요?").font(.title3)
            TextField("", text: $newCloth.size)
            
            Button(action: {
                saveCloth()
//                isNavigationActive = true
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}


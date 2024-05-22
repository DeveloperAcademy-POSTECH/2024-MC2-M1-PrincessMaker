<<<<<<< HEAD
import SwiftUI
import SwiftData
import UIKit
=======
//
//  UpdateView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//


import SwiftUI
import SwiftData
>>>>>>> Design/#16

struct UpdateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
<<<<<<< HEAD
    @Binding var selectedCloth: Cloth
    @State private var selectedMainCategory: MainCategory?
    @State private var isMainCategoryExpanded = false
    
    
=======
    @State var cloth: Cloth

>>>>>>> Design/#16
    func updateCloth() {
        do {
            try modelContext.save()
            print("Cloth updated successfully")
            dismiss()
        } catch {
            print("Failed to update cloth: \(error)")
        }
    }
<<<<<<< HEAD
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("옷 수정 뷰입니다")
            TextEditor(text: $selectedCloth.name).frame(width: 100, height: 50)
            TextEditor(text: $selectedCloth.size).frame(width: 100, height: 50)
            DisclosureGroup(selectedCloth.selectedSubCategory, isExpanded: $isMainCategoryExpanded) {
                if let mainCategory = MainCategory(rawValue: selectedCloth.selectedMainCategory) {
                    ForEach(mainCategory.subcategories, id: \.self) { subcategory in
                        Button(action: {
                            selectedCloth.selectedSubCategory = subcategory
                            isMainCategoryExpanded = false
                        }) {
                            Text(subcategory)
                                .foregroundColor(selectedCloth.selectedSubCategory == subcategory ? .yellow : .primary)
                        }
                    }
                }
            }
            Image(uiImage: selectedCloth.numericalUIImage ?? UIImage(resource: .imageEditorBasic))
            
            Spacer()
=======

    var body: some View {
        VStack {
            Text("옷 수정 뷰입니다")
            TextField("이름", text: $cloth.name)
            TextField("사이즈", text: $cloth.size)
            // 추가적인 필드나 UI 요소들을 여기 추가합니다.
            TextField("옷 종류", text: $cloth.selectedSubCategory)
>>>>>>> Design/#16
            
            Button(action: {
                updateCloth()
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}

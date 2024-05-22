//
//  FirstSubmit.swift
//  STOD
//
<<<<<<< HEAD
=======
//  Created by SOOKYUNG CHO on 5/19/24.
//


//
//  FirstSubmit.swift
//  STOD
//
>>>>>>> Design/#16
//  Created by 김이예은 on 5/19/24.
//

import SwiftUI
import SwiftData

struct FirstSubmit: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
<<<<<<< HEAD
    @Binding var newCloth: Cloth
    @State private var selectedMainCategory: MainCategory?
    @State private var selectedSubCategory: String?
//    @State private var isNavigationActive = false
    
    
    private func saveCloth() {
        modelContext.insert(newCloth)
        newCloth = Cloth(name: "", size: "", numericalPhotoPath: nil, mainPhotoPath: nil, selectedSubCategory: "", selectedMainCategory: "")
        dismiss()
=======
//    @State var cloth: Cloth
    @Binding var cloth: Cloth
    @State private var selectedMainCategory: MainCategory?
    @State private var selectedSubCategory: String?
    @State private var isNavigationActive = false
    

    private func saveCloth() {
            modelContext.insert(cloth)
            dismiss()
>>>>>>> Design/#16
    }
    
    var body: some View {
        VStack {
            Text("옷의 카테고리를 선택해주세요")
            ForEach(MainCategory.allCases, id: \.self) { category in
<<<<<<< HEAD
                Button(action: {
                    selectedMainCategory = category
                    selectedSubCategory = category.rawValue
                }) {
                    Text(category.rawValue)
                        .foregroundColor(selectedMainCategory == category ? .yellow : .primary)
                }
            }
=======
                            Button(action: {
                                selectedMainCategory = category
                                selectedSubCategory = category.rawValue
                            }) {
                                Text(category.rawValue)
                                    .foregroundColor(selectedMainCategory == category ? .yellow : .primary)
                            }
                        }
>>>>>>> Design/#16
            
            Text("It's a third page")
            Text("옷 종류를 알려주세요")
            
            if let selectedMainCategory = selectedMainCategory {
<<<<<<< HEAD
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
=======
                            ForEach(selectedMainCategory.subcategories, id: \.self) { subcategory in
                                Button(action: {
                                    selectedSubCategory = subcategory
                                    cloth.selectedSubCategory = subcategory
                                }) {
                                    Text(subcategory)
                                        .foregroundColor(selectedSubCategory == subcategory ? .yellow : .primary)
                                }
                            }
                        }

            Text("옷 이름을 알려주세요").font(.title3)
            TextField("", text: $cloth.name)
            Text("어떤 사이즈를 구매하셨나요?").font(.title3)
            TextField("", text: $cloth.size)

            Button(action: {
                // Perform any action you want before navigation
                saveCloth()
                isNavigationActive = true
>>>>>>> Design/#16
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}
<<<<<<< HEAD

=======
>>>>>>> Design/#16

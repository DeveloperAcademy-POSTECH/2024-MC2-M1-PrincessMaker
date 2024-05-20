import SwiftUI
import SwiftData
import UIKit

struct UpdateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    //    @Query var clothes: [Cloth]
    @Bindable var selectedCloth: Cloth
    @State private var localName: String
    @State private var localSize: String
    @State private var localSubCategory: String
    @State private var selectedMainCategory: MainCategory?
    @State private var isMainCategoryExpanded = false
    //    @Binding var selectedIndex: Int?
    //    @State private var selectedMainCategory: MainCategory?
    //    @State private var selectedSubCategory: String?
    //    @State private var isNavigationActive = false
    
    
    init(selectedCloth: Cloth) {
        self.selectedCloth = selectedCloth
        _localName = State(initialValue: selectedCloth.name)
        _localSize = State(initialValue: selectedCloth.size)
        _localSubCategory = State(initialValue: selectedCloth.selectedSubCategory)
        _selectedMainCategory = State(initialValue: MainCategory(rawValue: selectedCloth.selectedMainCategory))
    }
    
    func updateCloth() {
        do {
            //            guard let index = selectedIndex else { return }
            //            clothes[index].name = selectedCloth.name
            //            clothes[index].size = selectedCloth.size
            //            clothes[index].selectedSubCategory = selectedCloth.selectedSubCategory
            selectedCloth.name = localName
            selectedCloth.size = localSize
            selectedCloth.selectedSubCategory = localSubCategory
            //            selectedCloth = updatedCloth
            
            try modelContext.save()
            print("Cloth updated successfully")
            dismiss()
        } catch {
            print("Failed to update cloth: \(error)")
        }
    }
    
    var body: some View {
        VStack {
            Text("옷 수정 뷰입니다")
            TextField("", text: $localName)
            TextField("", text: $localSize)
            //            Picker("Main Category", selection: $selectedMainCategory) {
            //                ForEach(MainCategory.allCases, id: \.self) { category in
            //                    Text(category.rawValue).tag(category as MainCategory?)
            //                }
            //            }
            //            .pickerStyle(MenuPickerStyle())
            //            .padding()
//            Text(localSubCategory)
            DisclosureGroup(localSubCategory, isExpanded: $isMainCategoryExpanded) {
                if let mainCategory = MainCategory(rawValue: selectedCloth.selectedMainCategory) {
                    ForEach(mainCategory.subcategories, id: \.self) { subcategory in
                        Button(action: {
                            localSubCategory = subcategory
                            isMainCategoryExpanded.toggle()
                        }) {
                            Text(subcategory)
                                .foregroundColor(localSubCategory == subcategory ? .yellow : .primary)
                        }
                    }
                }
            }
            Image(uiImage: selectedCloth.numericalUIImage ?? UIImage(resource: .imageEditorBasic))
            
            Button(action: {
                updateCloth()
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}

import SwiftUI
import SwiftData
import UIKit

struct UpdateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedCloth: Cloth
    @State private var selectedMainCategory: MainCategory?
    @State private var isMainCategoryExpanded = false
    
    
    func updateCloth() {
        do {
            try modelContext.save()
            print("Cloth updated successfully")
            dismiss()
        } catch {
            print("Failed to update cloth: \(error)")
        }
    }
    
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
            
            Button(action: {
                updateCloth()
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}

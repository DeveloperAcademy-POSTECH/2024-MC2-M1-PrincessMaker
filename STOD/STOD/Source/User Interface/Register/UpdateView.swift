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

//    @Binding var selectedIndex: Int?
//    @State private var selectedMainCategory: MainCategory?
//    @State private var selectedSubCategory: String?
//    @State private var isNavigationActive = false

    
    init(selectedCloth: Cloth) {
            self.selectedCloth = selectedCloth
            _localName = State(initialValue: selectedCloth.name)
            _localSize = State(initialValue: selectedCloth.size)
            _localSubCategory = State(initialValue: selectedCloth.selectedSubCategory)
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
            // 추가적인 필드나 UI 요소들을 여기 추가합니
            TextField("", text: $localSubCategory)
//            if let selectedMainCategory = selectedMainCategory {
//                ForEach(selectedMainCategory.subcategories, id: \.self) { subcategory in
//                    Button(action: {
//                        selectedSubCategory = subcategory
//                        selectedCloth.selectedSubCategory = subcategory
//                    }) {
//                        Text(subcategory)
//                            .foregroundColor(selectedSubCategory == subcategory ? .yellow : .primary)
//                    }
//                }
//            }
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

import SwiftUI
import SwiftData

struct UpdateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query var clothes: [Cloth]
    @Binding var selectedCloth: Cloth
    @Binding var selectedIndex: Int?

    func updateCloth() {
        do {
            guard let index = selectedIndex else { return }
            clothes[index].name = selectedCloth.name
            clothes[index].size = selectedCloth.size
            clothes[index].selectedSubCategory = selectedCloth.selectedSubCategory
            
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
            TextField("", text: $selectedCloth.name)
            TextField("", text: $selectedCloth.size)
            // 추가적인 필드나 UI 요소들을 여기 추가합니다.
            TextField("", text: $selectedCloth.selectedSubCategory)
            
            Button(action: {
                updateCloth()
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}

//
//  UpdateView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//


import SwiftUI
import SwiftData

struct UpdateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State var cloth: Cloth

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
        VStack {
            Text("옷 수정 뷰입니다")
            TextField("이름", text: $cloth.name)
            TextField("사이즈", text: $cloth.size)
            // 추가적인 필드나 UI 요소들을 여기 추가합니다.
            TextField("옷 종류", text: $cloth.selectedSubCategory)
            
            Button(action: {
                updateCloth()
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}

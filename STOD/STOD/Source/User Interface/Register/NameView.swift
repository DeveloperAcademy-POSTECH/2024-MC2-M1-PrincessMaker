//
//  FirstSubmit.swift
//  STOD
//
//  Created by 김이예은 on 5/19/24.
//

import SwiftUI
import SwiftData

struct NameView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var newCloth: Cloth
    @State private var selectedMainCategory: MainCategory?
    @State private var selectedSubCategory: String?
//    @State private var isNavigationActive = false
    
    
    var body: some View {
        VStack {
            Text("옷 이름을 알려주세요").font(.title3)
            TextField("", text: $newCloth.name)
            Text("어떤 사이즈를 구매하셨나요?").font(.title3)
            TextField("", text: $newCloth.size)
            
            Button(action: {
//                saveCloth()
//                isNavigationActive = true
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}


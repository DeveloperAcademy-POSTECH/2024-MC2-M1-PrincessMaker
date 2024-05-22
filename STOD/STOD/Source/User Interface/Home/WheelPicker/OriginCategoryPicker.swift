//
//  CategoryPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/21/24.
//

import SwiftUI

struct OriginCategoryPicker: View {
    @State private var config: OriginWheelPicker.Config = .init()
    @State var selectedCategory: MainCategory = .recent
    
    var body: some View {
        NavigationStack {
            VStack {
                OriginWheelPicker(config: config, selectedCategory: $selectedCategory)
                    .frame(height: 200, alignment: .bottom)
            }
            .navigationTitle("Wheel Picker")
        }
    }
}

#Preview {
    OriginCategoryPicker()
}

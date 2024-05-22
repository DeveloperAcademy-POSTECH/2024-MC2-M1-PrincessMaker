//
//  RefCategoryPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/22/24.
//

import SwiftUI

struct RefCategoryPicker: View {
    @State private var config: RefWheelPicker.Config = .init()
    @State var selectedCategory: MainCategory? = .recent
    @State var value: Int = 15
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(value)")
                RefWheelPicker(config: config, selectedCategory: $selectedCategory, value: $value)
                    .frame(height: 200, alignment: .bottom)
            }
            .navigationTitle("Wheel Picker")
        }
    }
}

#Preview {
    RefCategoryPicker()
}

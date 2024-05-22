//
//  CategoryPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/21/24.
//

import SwiftUI

struct CategoryPicker: View {
    @State private var config: WheelPicker.Config = .init()
    @State var selectedCategory: MainCategory? = .recent
    @State var value: Int = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(value)")
                WheelPicker(config: config, selectedCategory: $selectedCategory, value: $value)
                    .frame(height: 80)
            }
            .navigationTitle("Wheel Picker")
        }
    }
}

#Preview {
    CategoryPicker()
}

//
//  CategoryPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/21/24.
//

import SwiftUI

struct OriginCategoryPicker: View {
    @State private var config: OriginWheelPicker.Config = .init()
    @State var selectedCategory: MainCategory? = .recent
    @State var value: Int = 15
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("\(value)")
                OriginWheelPicker(config: config, selectedCategory: $selectedCategory, value: $value)
                    .frame(height: 200, alignment: .bottom)
            }
            .navigationTitle("Wheel Picker")
        }
    }
}

#Preview {
    OriginCategoryPicker()
}

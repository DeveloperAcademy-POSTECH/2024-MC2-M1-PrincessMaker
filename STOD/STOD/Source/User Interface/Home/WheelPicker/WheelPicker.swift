//
//  WheelPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/21/24.
//

import SwiftUI

struct WheelPicker: View {
    /// Config
    var config: Config
    /// View Status
    @Binding var selectedCategory: MainCategory?
    @Binding var value: Int
    @State var isLoaded: Bool = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let leadingPadding = size.width / 2 - 24
            let trailingPadding = size.width / 2 - 24
            
            ScrollView(.horizontal) {
                HStack(spacing: config.spacing) {
                    ForEach(0...config.count, id: \.self) { index in
                        let category = MainCategory.allCases[index % config.count]
                        
                        CategoryButton(selectedCategory: $selectedCategory, category: category)
                            .onTapGesture {
                                selectedCategory = category
                                value = index
                                print(value)
                                print(selectedCategory)
                            }
                    }
                }
                .frame(height: size.height)
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: .init(get: {
                let position = isLoaded ? value : nil
                return position
            }, set: { newValue in
                if let newValue { value = newValue }
            }))
            .safeAreaPadding(.leading, leadingPadding)
            .safeAreaPadding(.trailing, trailingPadding)
            .onAppear {
                if !isLoaded { isLoaded = true }
            }
            .onChange(of: value) { oldValue, newValue in
                HapticManager.instance.impact(style: .light)
                selectedCategory = MainCategory.allCases[value%config.count]
            }
        }
    }
    
    struct Config: Equatable {
        var count: Int = MainCategory.allCases.count-1
        var totalSteps: Int = 200
        var spacing: CGFloat = 13
    }
}

#Preview {
    WheelPicker(config: WheelPicker.Config(), selectedCategory: .constant(.top), value: .constant(0))
}

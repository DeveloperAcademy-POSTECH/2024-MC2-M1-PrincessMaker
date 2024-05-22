//
//  ScrollOnlyWheelPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/22/24.
//

import SwiftUI

struct ScrollOnlyWheelPicker: View {
    /// Config
    var config: Config
    /// View Status
    @Binding var selectedCategory: MainCategory
    @State var value: Int = -15
    @State var isLoaded: Bool = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let horizontalPadding = size.width / 2
            let totalSteps = config.steps * config.count
            
            ScrollView(.horizontal) {
                HStack(spacing: config.spacing) {
                    ForEach(-totalSteps...totalSteps, id: \.self) { index in
                        let correctedIndex = index + totalSteps/2
                        let remainder = correctedIndex % config.steps
                        let inRange = correctedIndex >= 0 && correctedIndex <= totalSteps
                        
                        Divider()
                            .background(.stodWhite)
                            .frame(width: 0, height: remainder == 0 ? 20 : 12, alignment: .center)
                            .frame(maxHeight: 20, alignment: .top)
                            .overlay(alignment: .bottom) {
                                if remainder == 0 && inRange {
                                    CategoryButton(selectedCategory: $selectedCategory, category: MainCategory.allCases[correctedIndex/config.steps])
                                        .offset(y: 78)
                                }
                            }
                    }
                }
                .frame(height: size.height, alignment: .top)
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
            .overlay(alignment: .top) {
                Rectangle()
                    .foregroundStyle(.accent)
                    .frame(width: 1, height: 20, alignment: .center)
                    .frame(maxHeight: 20, alignment: .top)
            }
            .safeAreaPadding(.horizontal, -horizontalPadding)
            .onAppear {
                if !isLoaded { isLoaded = true }
            }
            .onChange(of: value) { oldValue, newValue in
                HapticManager.instance.impact(style: .light)
                let correctedValue = value + totalSteps
                let remainder = correctedValue % config.steps
                let inRange = correctedValue >= 0 && correctedValue <= totalSteps
                
                if (Float(remainder) > 2.5) && inRange {
                    selectedCategory = MainCategory.allCases[(correctedValue/config.steps)+1]
                } else if inRange {
                    selectedCategory = MainCategory.allCases[(correctedValue)/config.steps]
                }
                print(value)
                print("수정된 값: \(correctedValue)")
            }
        }
        
    }
    
    struct Config: Equatable {
        var count: Int = MainCategory.allCases.count-1
        var steps: Int = 5
        var spacing: CGFloat = 13
    }
}

#Preview {
    ScrollOnlyWheelPicker(config: ScrollOnlyWheelPicker.Config(), selectedCategory: .constant(.recent))
}

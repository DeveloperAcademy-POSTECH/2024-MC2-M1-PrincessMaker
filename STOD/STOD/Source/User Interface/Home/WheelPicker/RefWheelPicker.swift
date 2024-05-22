//
//  WheelPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/21/24.
//

import SwiftUI

struct RefWheelPicker: View {
    /// Config
    var config: Config
    /// View Status
    @Binding var selectedCategory: MainCategory?
    @Binding var value: Int
    @State var isLoaded: Bool = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let padding = size.width / 2
            
            ScrollView(.horizontal) {
                HStack(spacing: config.spacing) {
                    let totalSteps = config.steps * config.count
                    
                    ForEach(0...totalSteps, id: \.self) { index in
                        let remainder = index % config.steps

                        Divider()
                            .background(.stodWhite)
                            .frame(width: 0, height: remainder == 0 ? 20 : 12, alignment: .center)
                            .frame(maxHeight: 20, alignment: .top)
                            
                            .overlay(alignment: .bottom) {
                                if remainder == 0 {
                                    CategoryButton(selectedCategory: $selectedCategory, category: MainCategory.allCases[index/config.steps])
                                        .offset(y: 60)
                                        .onTapGesture {
                                            print("Hello")
                                        }
                                }
                            }
                    }
                }.scrollTargetLayout()
                .frame(height: size.height)
                
            }
            .contentMargins(.horizontal, padding, for: .scrollContent)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: .init(get: {
                let position = isLoaded ? value : nil
                return position
            }, set: { newValue in
                if let newValue { value = newValue }
            }))
            .overlay(alignment: .center) {
                Rectangle()
                    .foregroundStyle(.accent)
                    .frame(width: 1, height: 20, alignment: .center)
                    .frame(maxHeight: 20, alignment: .top)
            }
            
            .onAppear {
                if !isLoaded { isLoaded = true }
            }
            .onChange(of: value) { oldValue, newValue in
                HapticManager.instance.impact(style: .light)
                let remainder = value % 5
                if Float(remainder) > 2.5 {
                    selectedCategory = MainCategory.allCases[(value/config.steps)+1]
                } else {
                    selectedCategory = MainCategory.allCases[(value)/config.steps]
                }
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
    RefWheelPicker(config: RefWheelPicker.Config(), selectedCategory: .constant(.top), value: .constant(1))
}

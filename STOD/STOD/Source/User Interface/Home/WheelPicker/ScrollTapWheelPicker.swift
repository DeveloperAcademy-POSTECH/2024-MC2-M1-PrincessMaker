//
//  ScrollOnlyWheelPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/22/24.
//

import SwiftUI

struct ScrollTapWheelPicker: View {
    /// Config
    var config: Config
    /// View Status
    @Binding var selectedCategory: MainCategory
    @State var value: Int = -30
    @State var isLoaded: Bool = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let spacing = size.width/30
            let totalSteps = config.steps * config.count
            
            ScrollView(.horizontal) {
                ScrollViewReader { reader in
                    HStack(spacing: spacing) {
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
                                        let category = MainCategory.allCases[correctedIndex/config.steps]
                                        CategoryButton(selectedCategory: $selectedCategory, category: category)
                                            .offset(y: 78)
                                            .onTapGesture {
                                                selectedCategory = category
                                                withAnimation {
                                                    //scrollToValue(target: index-15, reader: reader)
                                                    reader.scrollTo(index, anchor: .center)
                                                    HapticManager.instance.impact(style: .light)
                                                }
                                            }
                                    }
                                }
                        }
                    }
                    .frame(height: size.height, alignment: .top)
                    .scrollTargetLayout()
                    
                }
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
                    .frame(width: 2, height: 20, alignment: .center)
                    .frame(maxHeight: 20, alignment: .top)
            }
            // 19 or 1
            // .safeAreaPadding(.horizontal, (UIScreen.main.bounds.width-393+2)/2)
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
            }
        }
        
    }
    
    struct Config: Equatable {
        var count: Int = MainCategory.allCases.count-1
        var steps: Int = 5
        var spacing: CGFloat = 13
    }
    
    // `value`를 점진적으로 변경하는 함수. 속도가 너무 일정해서 사용하지는 않았으나 개선 가능성 있음.
    func scrollToValue(target: Int, reader: ScrollViewProxy) {
        // 목표 값으로 점진적으로 이동
        let step = target > value ? 1 : -1
        var nextValue = value + step
        
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            self.value = nextValue
            reader.scrollTo(nextValue, anchor: .center)
            
            if nextValue == target {
                timer.invalidate() // 목표에 도달하면 타이머를 중지
            } else {
                nextValue += step
            }
        }
    }
}

#Preview {
    ScrollTapWheelPicker(config: ScrollTapWheelPicker.Config(), selectedCategory: .constant(.recent))
}

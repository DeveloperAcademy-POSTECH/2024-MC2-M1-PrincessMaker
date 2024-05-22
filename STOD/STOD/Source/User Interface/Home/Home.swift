//
//  Home.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI

struct Home: View {
    @State private var selectedCategory: MainCategory? = .recent
    let config = ScrollOnlyWheelPicker.Config.init()
    var body: some View {
        VStack(spacing: 24) {
            PIPSection()
            //CategorySection(selectedCategory: $selectedCategory)
            VStack(alignment: .leading) {
                Text("어떤 옷을 찾고 계신가요?")
                    .font(.StodHeadline)
                    .padding(.horizontal, 16)
                ScrollOnlyWheelPicker(config: config, selectedCategory: $selectedCategory)
                    .frame(height: 96, alignment: .top)
            }
        }
    }
}

#Preview {
    Home()
}

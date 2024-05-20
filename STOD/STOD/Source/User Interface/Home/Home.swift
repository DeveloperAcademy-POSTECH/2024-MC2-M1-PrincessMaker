//
//  Home.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 24) {
            PIPSection()
            CategorySection()
            VStack(alignment: .leading) {
                Text("어떤 옷을 찾고 계신가요?")
                    .font(.StodHeadline)
                Image(.categoryRuler)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 20)
            }
        }
    }
}

#Preview {
    Home()
}

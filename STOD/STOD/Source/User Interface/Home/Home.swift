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
        }
    }
}

#Preview {
    Home()
}

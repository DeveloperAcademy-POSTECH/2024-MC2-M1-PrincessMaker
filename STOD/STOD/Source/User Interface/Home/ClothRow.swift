//
//  ClothRow.swift
//  STOD
//
//  Created by cheon on 5/22/24.
//

import SwiftUI

struct ClothRow: View {
    let selectedCategory: MainCategory
    let cloth: Cloth
    
    var body: some View {
        HStack(spacing: 12) {
            Image(cloth.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 68, height: 48)
                .background(.stodWhite)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
            VStack(alignment: .leading, spacing:11) {
                Text(cloth.title)
                    .font(.StodTitle1)
                Text("\(cloth.subCategory) . \(cloth.size)")
                    .font(.StodBody)
            }
            
            Spacer()
            
            if cloth.isPinned && selectedCategory != .recent{
                Image(systemName: "pin.fill")
                    .font(.StodTitle1)
            }
        }
        .padding(12)
        .frame(height: 72)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.stodGray200)
        }
    }
}

#Preview {
    ClothRow(selectedCategory: .top, cloth: Cloth.dummy[1])
}

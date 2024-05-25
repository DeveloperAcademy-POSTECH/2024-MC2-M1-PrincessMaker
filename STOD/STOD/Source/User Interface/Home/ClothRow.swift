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
    @Binding var selectedCloth: Cloth?
    
    var isSelected: Bool {
        cloth == selectedCloth
    }
    
    var body: some View {
        Button {
            selectedCloth = cloth
        } label: {
            HStack(spacing: 12) {
                Image(uiImage: cloth.clothUIImage ?? UIImage(resource: .STOD))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 68, height: 48)
                    .background(.stodWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                VStack(alignment: .leading, spacing: 11) {
                    Text(cloth.name)
                        .font(.StodTitle1)
                    Text("\(cloth.subCategory) . \(cloth.size)")
                        .font(.StodBody)
                }
                .foregroundStyle(isSelected ? Color.stodBlack : Color.stodWhite)
                
                Spacer()
                
                if cloth.isPinned && selectedCategory != .recent{
                    Image(systemName: "pin.fill")
                        .font(.StodTitle1)
                        .foregroundStyle(isSelected ? Color.stodBlack : Color.stodWhite)
                }
            }
            .padding(12)
            .frame(height: 72)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(isSelected ? .accent : .stodGray200)
            }
            .animation(.easeInOut(duration: 0.2), value: selectedCloth)
        }
    }
}

#Preview {
    ClothRow(selectedCategory: .top, cloth: SampleCloth.contents[0], selectedCloth: .constant(SampleCloth.contents[0]))
}

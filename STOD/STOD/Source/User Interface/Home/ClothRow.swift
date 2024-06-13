//
//  ClothRow.swift
//  STOD
//
//  Created by cheon on 5/22/24.
//

import SwiftUI
import SwiftData

struct ClothRow: View {
    let selectedCategory: MainCategory
    let cloth: Cloth
    @Binding var selectedCloth: Cloth?
    @Binding var showPIP: Bool
    
    var isSelected: Bool {
        cloth == selectedCloth
    }
    
    var body: some View {
        Button {
            if selectedCloth == cloth {
                showPIP = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    selectedCloth = nil
                }
            } else {
                selectedCloth = cloth
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    showPIP = true
                }
            }
            
            
            //            selectedCloth = cloth
            //
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                showPIP = true
//            }
        } label: {
            HStack(spacing: 12) {
                if let uiImageName = cloth.clothUIImage {
                    Image(uiImage: uiImageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 68, height: 48)
                        .background(.stodWhite)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                } else if let category = MainCategory(rawValue: cloth.mainCategory) {
                    category.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 68, height: 48)
                        .background(.stodGray100.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                
                
                VStack(alignment: .leading, spacing: 11) {
                    Text(cloth.name)
                        .font(.StodTitle1)
                    Text("\(cloth.subCategory)")
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
            .animation(.easeInOut(duration: 0.05), value: selectedCloth)
        }
    }
}

#Preview {
    ClothRow(selectedCategory: .top, cloth: SampleCloth.contents[0], selectedCloth: .constant(SampleCloth.contents[0]), showPIP: .constant(false))
}

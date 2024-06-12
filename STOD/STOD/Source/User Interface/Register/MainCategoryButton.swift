//
//  MainCategoryButton.swift
//  STOD
//
//  Created by 이윤학 on 5/25/24.
//

import SwiftUI

struct RegisterCategoryButton: View {
    let category: MainCategory
    
    var localizedMainCategoryRegister: LocalizedStringKey {
        return LocalizedStringKey(category.rawValue)
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text(localizedMainCategoryRegister)
                .foregroundColor(.white)
                .font(.StodTitle1)
                .fixedSize()
                .padding(.top)
            Spacer()
            category.image
                .resizable()
                .scaledToFill()
                .frame(width: 82, height: 95)
                .clipped()
        }
        .padding(.leading, 16)
        .frame(height: 100)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.stodGray200)
        }
    }
}

#Preview {
    RegisterCategoryButton(category: .shoes)
}

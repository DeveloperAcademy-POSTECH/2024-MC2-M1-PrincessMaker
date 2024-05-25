//
//  BigCategory.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//

import SwiftUI

struct Register: View {
    @Environment(\.dismiss) private var dismiss
    @State var cloth: Cloth = Cloth()
    @State private var showNextView = false
    
    private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                Spacer().frame(height: 54)
                
                Text("옷의 카테고리를 선택해주세요")
                    .font(.StodHeadline)
                    .foregroundColor(.white)
                
                Spacer().frame(height: 67)
                
                LazyVGrid(columns: columns) {
                    ForEach(0..<MainCategory.allCases.count) { index in
                        let category = MainCategory.allCases[index]
                        if category != .recent {
                            Button {
                                cloth.mainCategory = category.rawValue
                                showNextView = true
                            } label: {
                                RegisterCategoryButton(category: MainCategory.allCases[index])
                            }
                            .padding(.horizontal, 7)
                            .padding(.vertical, 12)
                        }
                    }
                }
                .navigationDestination(isPresented: $showNextView) {
                    ClothRegister(cloth: $cloth)
                        .navigationBarBackButtonHidden()
                }
                
                Spacer()
            }
            .padding(.horizontal, 9)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.StodTitle1)
                    }
                    .tint(.stodWhite)
                }
            }
            .onAppear {
                cloth = Cloth()
            }
            
        }
    }
}

#Preview {
    Register()
}

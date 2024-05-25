//
//  ClothRegister.swift
//  STOD
//
//  Created by 이윤학 on 5/25/24.
//

import SwiftUI

struct ClothRegister: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var cloth: Cloth
    @State private var registerState: Int = 0
    @FocusState private var focusField: Field?
    @GestureState private var isDragging: Bool = false
    
    var buttonEnable: Bool {
        if registerState == 0 {
            return !cloth.name.isEmpty
        } else if registerState == 1 {
            return !cloth.size.isEmpty
        } else {
            return true
        }
    }
    
    var titleText: String {
        if registerState < StringLiterals.Register.allCases.count {
            return StringLiterals.Register.allCases[registerState].rawValue
        } else {
            return "Out of Range"
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Color.black.frame(height: 38)
                
                Text(titleText)
                    .font(.StodHeadline)
                    .foregroundColor(.white)
                
                Color.black.frame(height: 24)
                
                if registerState >= 2 {
                    SubCategorySection
                    Color.black.frame(height: 24)
                }
                
                if registerState >= 1 {
                    SizeSection
                    Color.black.frame(height: 24)
                }
                
                if registerState >= 0 {
                    NameSection
                }
                
                Color.black
                
                RegisterNextButton(isAvailable: buttonEnable, registerState: $registerState)
            }
            .padding()
            .animation(.snappy, value: registerState)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    backButton
                }
            }
            .onChange(of: registerState) { oldValue, newValue in
                if registerState == 0 {
                    focusField = .name
                } else if registerState == 1 {
                    focusField = .size
                } else {
                    focusField = nil
                }
                print(focusField)
            }
            .gesture(
                DragGesture()
                    .updating($isDragging) { value, state, _ in
                        state = true
                    }
                    .onEnded { value in
                        if value.translation.width > 100 {
                            // 임계값을 넘으면 registerState를 -1로 설정
                            if registerState > 0 {
                                registerState -= 1
                            } else {
                                dismiss()
                            }
                        }
                    }
            )
            
        }
    }
}


extension ClothRegister {
    var NameSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            if registerState >= 1 {
                Text("이름")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                Spacer().frame(height: 10)
            }
            TextField("ex) 똥싼바지, 여리여리 블라우스", text: $cloth.name)
                .keyboardType(.default)
                .font(.StodTitle2)
                .padding(.leading, 4)
                .disabled(registerState >= 1)
                .focused($focusField, equals: .name)
            
            Spacer().frame(height: 12)
            
            Rectangle()
                .fill(Color.stodGray100)
                .frame(height: 1)
        }
        .opacity(registerState >= 0 ? 1 : 0)
        .onAppear {
            focusField = .name
        }
    }
    
    var SizeSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            if registerState >= 2 {
                Text("사이즈")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                Spacer().frame(height: 10)
            }
            TextField("ex) 스몰, XL, 240mm", text: $cloth.size)
                .keyboardType(.default)
                .font(.StodTitle2)
                .padding(.leading, 4)
                .disabled(registerState >= 2)
                .focused($focusField, equals: .size)
            
            Spacer().frame(height: 12)
            
            Rectangle()
                .fill(Color.stodGray100)
                .frame(height: 1)
        }
        .opacity(registerState >= 1 ? 1 : 0)
        .onAppear {
            focusField = .size
        }
    }
    
    var SubCategorySection: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), alignment: .leading)], alignment: .leading, spacing: 12) {
            ForEach(MainCategory.top.subcategories, id: \.self) { subcategory in
                Text(subcategory)
                    .font(.StodTitle1)
                    .foregroundColor(cloth.subCategory == subcategory ? Color.accentColor : Color.stodGray100)
                    .padding(.vertical,5)
                    .padding(.horizontal,10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(cloth.subCategory == subcategory ? Color.accentColor : Color.stodGray100, lineWidth: 2)
                    )
                    .onTapGesture {
                        cloth.subCategory = subcategory
                    }
            }
        }
    }
    
    var backButton: some View {
        Button {
            back()
        } label: {
            Image(systemName: "chevron.left")
                .font(.StodTitle1)
        }
        .tint(.stodWhite)
    }
    
    func back() {
        if registerState > 0 {
            registerState -= 1
        } else {
            dismiss()
        }
    }
}

#Preview {
    ClothRegister(cloth: .constant(Cloth()))
}


enum Field {
    case name
    case size
}

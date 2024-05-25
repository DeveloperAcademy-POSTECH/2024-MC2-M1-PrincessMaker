//
//  ClothRegister.swift
//  STOD
//
//  Created by 이윤학 on 5/25/24.
//

import SwiftUI

struct EssentialInfoRegister: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var cloth: Cloth
    @State private var registerState: Int = 0
    @FocusState private var focusField: Field?
    @GestureState private var isDragging: Bool = false
    @State private var showStartView = false
    @State private var showPicker = false
    @Binding var showRegisterView: Bool
    
    private func saveCloth() {
        modelContext.insert(cloth)
    }
    
    var buttonEnable: Bool {
        if registerState == 0 {
            return !cloth.name.isEmpty
        } else if registerState == 1 {
            return !cloth.size.isEmpty
        } else if registerState == 2 {
            return cloth.subCategory != ""
        } else if registerState == 3 {
            return cloth.numericalImageData != nil
        } else if registerState == 4 {
            return cloth.clothImageData != nil
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
            VStack(alignment: .leading, spacing: 24) {
                Color.black.frame(height: 14)
                
                Text(titleText)
                    .font(.StodHeadline)
                    .foregroundColor(.white)
                
                if registerState == 4 {
                    ClothImageSection
                }
                
                if registerState >= 3 && registerState < 4 {
                    MeasurementImageSection
                }
                
                if registerState >= 2 && registerState < 4 {
                    SubCategorySection
                }
                
                if registerState >= 1 && registerState < 4 {
                    SizeSection
                }
                
                if registerState >= 0 && registerState < 4 {
                    NameSection
                }
                
                Color.black
                
                NextButton
                
                if registerState == 4 {
                    SkipButton
                }
            }
            .padding()
            .animation(.snappy, value: registerState)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BackButton
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
            }
            .gesture(
                DragGesture()
                    .updating($isDragging) { value, state, _ in
                        state = true
                    }
                    .onEnded { value in
                        if value.translation.width > 100 {
                            // 임계값을 넘으면 registerState를 -1로 설정
                            back()
                        }
                    }
            )
            .navigationDestination(isPresented: $showStartView) {
                //StartView()
            }
            
        }
    }
}


extension EssentialInfoRegister {
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
        VStack(alignment: .leading, spacing: 0) {
            if registerState >= 3 {
                Text("종류")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                
                Spacer().frame(height: 10)
                
                Text(cloth.subCategory)
                    .font(.StodTitle2)
                
                Spacer().frame(height: 12)
                
                Rectangle()
                    .fill(Color.stodGray100)
                    .frame(height: 1)
            }
            
            if registerState == 2 {
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
        }
    }
    
    var MeasurementImageSection: some View {
        HStack {
            Button {
                showPicker = true
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                        .frame(height: 192)
                    if let data = cloth.numericalImageData {
                        Image(uiImage: UIImage(data: data)!)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 192, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        Image(systemName: "photo.badge.plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 23)
                            .foregroundColor(.stodGray100)
                    }
                }
                
            }
            .fullScreenCover(isPresented: $showPicker) {
                ImageEditPicker(inputImageData: $cloth.numericalImageData)
            }
        }
    }
    
    var ClothImageSection: some View {
        HStack {
            Button {
                showPicker = true
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                        .frame(height: 192)
                    if let data = cloth.clothImageData {
                        Image(uiImage: UIImage(data: data)!)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 192, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        Image(systemName: "photo.badge.plus")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 23)
                            .foregroundColor(.stodGray100)
                    }
                }
                
            }
            .fullScreenCover(isPresented: $showPicker) {
                ImageEditPicker(inputImageData: $cloth.clothImageData)
            }
        }
    }
    
    var NextButton: some View {
        Button {
            registerState += 1
            if registerState == 5 {
                saveCloth()
                showStartView = true
            }
        } label: {
            HStack {
                Spacer()
                Text("확인")
                    .font(.StodTitle1)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.vertical, 15)
            .background {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(buttonEnable ? .accent : .stodGray100)
            }
        }
        .disabled(!buttonEnable)
    }
    
    var SkipButton: some View {
        HStack {
            Spacer()
            Button {
                saveCloth()
                showRegisterView = false
            } label: {
                Text("나중에 할래요")
                    .font(.StodTitle2)
                    .foregroundColor(.stodGray100)
                    .underline()
            }
            Spacer()
        }
       
    }
    
    var BackButton: some View {
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
    EssentialInfoRegister(cloth: .constant(Cloth()), showRegisterView: .constant(false))
}


enum Field {
    case name
    case size
}

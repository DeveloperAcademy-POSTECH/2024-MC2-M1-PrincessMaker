//
//  ClothRegister.swift
//  STOD
//
//  Created by 이윤학 on 5/25/24.
//

import SwiftUI

struct RegisterDetailInfo: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var cloth: Cloth
    @State private var registerState: Int = 0
    @FocusState private var focusField: Field?
    @GestureState private var isDragging: Bool = false
    @State private var showSuccessView = false
    @State var showNumericalImagePicker = false
    @State var showClothImagePicker = false
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
            VStack {
                ScrollView(.vertical) {
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
                        
                        
                    }
                    .padding()
                }
                .scrollIndicators(.never)
                
                NextButton
                    .padding()
                if registerState == 4 {
                    SkipButton
                        .padding(.bottom, 16)
                }
            }
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
            .fullScreenCover(isPresented: $showSuccessView) {
                RegisetSuccess(name: $cloth.name, showRegisterView: $showRegisterView)
            }
            
        }
    }
}


extension RegisterDetailInfo {
    var NameSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            if registerState >= 1 {
                Text("이름")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                Spacer().frame(height: 10)
            }
            TextField("ex) 딱 복숭아뼈까지 오는 청바지, 여리여리 블라우스", text: $cloth.name)
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
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(layoutButtons(in: UIScreen.main.bounds.width-32), id: \.self) { row in
                            HStack {
                                ForEach(row, id: \.self) { subcategory in
                                    Button(action: {
                                        cloth.subCategory = subcategory
                                    }) {
                                        Text(subcategory)
                                            .lineLimit(1)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .font(.StodTitle1)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .foregroundColor(cloth.subCategory == subcategory ? Color.accentColor : Color.stodGray100)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(cloth.subCategory == subcategory ? Color.accentColor : Color.stodGray100, lineWidth: 2)
                                            )
                                    }.padding(.vertical, 2)
                                }
                            }
                        }
                    }
            }
        }
    }
    
    var MeasurementImageSection: some View {
        HStack {
            Button {
                showNumericalImagePicker = true
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                        .frame(height: (UIScreen.main.bounds.width-32)/16*9)
                    if let data = cloth.numericalImageData {
                        Image(uiImage: UIImage(data: data)!)
                            .resizable()
                            .scaledToFill()
                            .frame(height: (UIScreen.main.bounds.width-32)/16*9, alignment: .center)
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
            .fullScreenCover(isPresented: $showNumericalImagePicker) {
                ImageEditPicker(inputImageData: $cloth.numericalImageData)
            }
        }
    }
    
    var ClothImageSection: some View {
        HStack {
            Button {
                showClothImagePicker = true
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                        .frame(height: (UIScreen.main.bounds.width-32)/16*9)
                    if let data = cloth.clothImageData {
                        Image(uiImage: UIImage(data: data)!)
                            .resizable()
                            .scaledToFill()
                            .frame(height: (UIScreen.main.bounds.width-32)/16*9, alignment: .center)
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
            .fullScreenCover(isPresented: $showClothImagePicker) {
                ImageEditPicker(inputImageData: $cloth.clothImageData)
            }
        }
    }
    
    var NextButton: some View {
        Button {
            registerState += 1
            if registerState == 5 {
                saveCloth()
                showSuccessView = true
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
                showSuccessView = true
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
    
    private var subcategories: [String] {
        guard let mainCategory = MainCategory(rawValue: cloth.mainCategory) else {
            return []
        }
        return mainCategory.subcategories
    }
    
    private func calculateButtonWidth(text: String, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width) + 20
    }
    
    private func layoutButtons(in width: CGFloat) -> [[String]] {
        var rows: [[String]] = [[]]
        var currentRowWidth: CGFloat = 0
        let padding: CGFloat = 10
        let font = UIFont.systemFont(ofSize: 17)
        
        for subcategory in subcategories {
            let buttonWidth = calculateButtonWidth(text: subcategory, font: font)
            if currentRowWidth + buttonWidth + padding > width {
                rows.append([subcategory])
                currentRowWidth = buttonWidth
            } else {
                rows[rows.count - 1].append(subcategory)
                currentRowWidth += buttonWidth + padding
            }
        }
        
        return rows
    }
    
    private func calculateHeight(in width: CGFloat) -> CGFloat {
        var rows: [[String]] = [[]]
        var currentRowWidth: CGFloat = 0
        let padding: CGFloat = 10
        let font = UIFont.systemFont(ofSize: 17)
        
        for subcategory in subcategories {
            let buttonWidth = calculateButtonWidth(text: subcategory, font: font)
            if currentRowWidth + buttonWidth + padding > width {
                rows.append([subcategory])
                currentRowWidth = buttonWidth
            } else {
                rows[rows.count - 1].append(subcategory)
                currentRowWidth += buttonWidth + padding
            }
        }
        
        return CGFloat(rows.count * 36)
    }
}

#Preview {
    RegisterDetailInfo(cloth: .constant(Cloth(mainCategory: "아우터")), showRegisterView: .constant(false))
}


enum Field {
    case name
    case size
}

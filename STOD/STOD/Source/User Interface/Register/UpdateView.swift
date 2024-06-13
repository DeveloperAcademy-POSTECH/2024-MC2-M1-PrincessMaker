//
//  UpdateView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//


import SwiftUI
import SwiftData


struct UpdateView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query var clothes: [Cloth]
    @State var editCloth: Cloth = Cloth()
    @State var showNumericalImagePicker = false
    @State var showClothImagePicker = false
    @Binding var targetIndex: Int
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 24) {
                    Spacer().frame(height: 24)
                    Text("정보를 수정해주세요.")
                        .font(.StodHeadline)
                        .foregroundColor(.white)
                    
                    NameSection
                    SizeSection
                    SubCategorySection
                    NumericalImageSection
                    ClothImageSection
                    Spacer().frame(height: 24)
                }
                .padding()
            }
            .scrollIndicators(.hidden)
            
            NextButton
                .padding()
        }
        .onAppear {
            applyTargetData()
        }
        .dismissKeyboard()
    }
}

extension UpdateView {
    
    func applyTargetData() {
        let targetCloth = clothes[targetIndex]
        
        editCloth.mainCategory = targetCloth.mainCategory
        editCloth.name = targetCloth.name
        editCloth.size = targetCloth.size
        editCloth.subCategory = targetCloth.subCategory
        editCloth.numericalImageData = targetCloth.numericalImageData
        editCloth.clothImageData = targetCloth.clothImageData
        
    }
    
    func applyEditedData() {
        let targetCloth = clothes[targetIndex]
        
        targetCloth.mainCategory = editCloth.mainCategory
        targetCloth.name = editCloth.name
        targetCloth.size = editCloth.size
        targetCloth.subCategory = editCloth.subCategory
        targetCloth.numericalImageData = editCloth.numericalImageData
        targetCloth.clothImageData = editCloth.clothImageData
    }
    
    var NameSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("이름")
                .font(.StodBody)
                .foregroundColor(.stodGray100)
            Spacer().frame(height: 10)
            TextField("ex) 딱 복숭아뼈까지 오는 청바지, 여리여리 블라우스", text: $editCloth.name)
                .keyboardType(.default)
                .font(.StodTitle2)
                .padding(.leading, 4)
            
            Spacer().frame(height: 12)
            
            Rectangle()
                .fill(Color.stodGray100)
                .frame(height: 1)
        }
    }
    
    var SizeSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("사이즈")
                .font(.StodBody)
                .foregroundColor(.stodGray100)
            Spacer().frame(height: 10)
            TextField("ex) 스몰, XL, 240mm", text: $editCloth.size)
                .keyboardType(.default)
                .font(.StodTitle2)
                .padding(.leading, 4)
            
            
            Spacer().frame(height: 12)
            
            Rectangle()
                .fill(Color.stodGray100)
                .frame(height: 1)
        }
    }
    
    var SubCategorySection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("종류")
                .font(.StodBody)
                .foregroundColor(.stodGray100)
            
            Spacer().frame(height: 10)
            
            if let mainCategory = MainCategory(rawValue: editCloth.mainCategory) {
                Picker("종류", selection: $editCloth.subCategory) {
                    ForEach(mainCategory.subcategories, id: \.self) { subcategory in
                        Text(subcategory).tag(subcategory)
                            .font(.StodTitle1)
                        
                    }
                }
                .accentColor(.white)
                .pickerStyle(MenuPickerStyle())
                .offset(x: -4)
            }
            Spacer().frame(height: 12)
            
            Rectangle()
                .fill(Color.stodGray100)
                .frame(height: 1)
        }
    }
    
    var NumericalImageSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("수치 사진")
                .font(.StodBody)
                .foregroundColor(.stodGray100)
            
            Spacer().frame(height: 10)
            
            Button {
                showNumericalImagePicker = true
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                        .frame(height: (UIScreen.main.bounds.width-32)/4*3)
                    if let data = editCloth.numericalImageData {
                        Image(uiImage: UIImage(data: data)!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width-32, height: (UIScreen.main.bounds.width-32)/4*3, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } else {
                        VStack(spacing: 12) {
                            Image(systemName: "photo.badge.plus")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 23)
                                .foregroundColor(.stodGray100)
                            Text("이곳에 보이는 대로 저장됩니다.")
                                .font(.StodBody)
                                .foregroundStyle(.stodGray100)
                        }
                        
                    }
                }
            }
            
        }
        .fullScreenCover(isPresented: $showNumericalImagePicker) {
            ImageEditPicker(inputImageData: $editCloth.numericalImageData)
        }
    }
    
    var ClothImageSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("옷 사진")
                .font(.StodBody)
                .foregroundColor(.stodGray100)
            
            Spacer().frame(height: 10)
            
            Button {
                showClothImagePicker = true
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                        .frame(height: (UIScreen.main.bounds.width-32)/4*3)
                    if let data = editCloth.clothImageData {
                        Image(uiImage: UIImage(data: data)!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width-32, height: (UIScreen.main.bounds.width-32)/4*3, alignment: .center)
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
            
        }
        .fullScreenCover(isPresented: $showClothImagePicker) {
            ImageEditPicker(inputImageData: $editCloth.clothImageData)
        }
    }
    
    var NextButton: some View {
        Button {
            applyEditedData()
            dismiss()
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
                    .fill(.accent)
            }
        }
    }
}

#Preview {
    UpdateView(targetIndex: .constant(1))
}

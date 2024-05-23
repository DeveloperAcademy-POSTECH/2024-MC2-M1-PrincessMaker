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
    @Binding var selectedCloth: Cloth
    @State private var selectedMainCategory: MainCategory?
    @State private var isMainCategoryExpanded = false
    
    func updateCloth() {
        do {
            try modelContext.save()
            print("Cloth updated successfully")
            dismiss()
        } catch {
            print("Failed to update cloth: \(error)")
        }
    }
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading) {
                Text("정보를 수정해주세요.")
                    .font(.StodHeadline)
                    .padding(.top, 32)
                
                //이름 정보
                Text("이름")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                    .padding(.top, 24)
                
                TextEditor(text: $selectedCloth.name).frame(width: 100, height: 30)
                    .font(.StodTitle1)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                
                Rectangle()
                    .fill(Color.stodGray100)
                    .frame(height: 1)
                    .padding(.bottom, 24)
                
                Spacer()
                
                //사이즈 정보
                Text("사이즈")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                    .padding(.top, 12)
                
                TextEditor(text: $selectedCloth.size).frame(width: 100, height: 30)
                    .font(.StodTitle1)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                
                Rectangle()
                    .fill(Color.stodGray100)
                    .frame(height: 1)
                    .padding(.bottom, 24)
                
                Spacer()
                
                //서브 카테고리 정보
                Text("종류")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                    .padding(.top, 12)
                
                
                if let mainCategory = MainCategory(rawValue: selectedCloth.selectedMainCategory) {
                    Picker("종류", selection: $selectedCloth.selectedSubCategory) {
                        ForEach(mainCategory.subcategories, id: \.self) { subcategory in
                            Text(subcategory).tag(subcategory)
                                .font(.StodTitle1)
                            
                        }
                    }.accentColor(.white)
                        .padding(.leading, 8)
                        .pickerStyle(MenuPickerStyle())
                }
                
                
                Rectangle()
                    .fill(Color.stodGray100)
                    .frame(height: 1)
                    .padding(.bottom, 24)
                
                Spacer()
                
                
                //수치사진 정보
                Text("수치 사진")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                    .padding(.top, 12)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                    
                    Image(uiImage: selectedCloth.numericalUIImage ?? UIImage(resource: .imageEditorBasic))
                        .resizable()
                        .frame(width: .infinity)
                    //                                .scaledToFill()
                        .cornerRadius(10)
                }.frame(width: .infinity, height: 188)
                
                Spacer()
                
                
                //옷사진 정보
                Text("옷 사진")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                    .padding(.top, 12)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                    
                    Image(uiImage: selectedCloth.mainUIImage ?? UIImage(resource: .imageEditorBasic))
                        .resizable()
                        .frame(width: .infinity)
                    //                                .scaledToFill()
                        .cornerRadius(10)
                }.frame(width: .infinity, height: 188)
                
                
                Button(action: {
                    updateCloth()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 48)
                            .foregroundColor(.accentColor) //이미지 선택되며 확인버튼 노란색으로
                        
                        Text("저장하기")
                            .font(.StodTitle1)
                            .foregroundColor(.black)
                        
                    }.padding(.top, 52)
                }
            }
        }
        .padding()
    }
}


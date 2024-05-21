//
//  FirstSubmit.swift
//  STOD
//
//  Created by 김이예은 on 5/19/24.
//

import SwiftUI
import SwiftData

struct Register: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var newCloth: Cloth
    @State private var selectedMainCategory: MainCategory?
    @State private var selectedSubCategory: String?
//    @State private var isNavigationActive = false
    
    
    private func saveCloth() {
        modelContext.insert(newCloth)
        newCloth = Cloth(name: "", size: "", numericalPhotoPath: nil, mainPhotoPath: nil, selectedSubCategory: "", selectedMainCategory: "")
        dismiss()
    }
    
    var body: some View {
        NavigationLink(destination: NameView(newCloth: $newCloth)){
                        VStack(alignment: .leading){
                            Text("옷의 카테고리를 선택해주세요")
                                .font(.StodHeadline)
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 16))
                                
                            
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 160, height: 100)
                                        .foregroundColor(.stodGray200)
                                    HStack{
                                        Text("아우터")
                                            .foregroundColor(.white)
                                        Image("Outer_character")
                                            .resizable()
                                            .frame(width: 82, height: 95)
                                    }

                                }
                                                        
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 160, height: 100)
                                        .foregroundColor(.stodGray200)
                                    HStack{
                                        Text("상의")
                                            .foregroundColor(.white)
                                        Image("Clothes_character")
                                            .resizable()
                                            .frame(width: 71, height: 98)
                                    }

                                }
                            }.padding(EdgeInsets(top: 80, leading: 16, bottom: 40, trailing: 16))
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 160, height: 100)
                                        .foregroundColor(.stodGray200)
                                    HStack{
                                        Text("하의")
                                            .foregroundColor(.white)
                                        Image("Pants_character")
                                            .resizable()
                                            .frame(width: 64, height: 83)
                                    }

                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 160, height: 100)
                                        .foregroundColor(.stodGray200)
                                    HStack{
                                        Text("원피스")
                                            .foregroundColor(.white)
                                        Image("Onepiece_character")
                                            .resizable()
                                            .frame(width: 65, height: 88)
                                    }

                                }
                            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 40, trailing: 16))
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 160, height: 100)
                                        .foregroundColor(.stodGray200)
                                    HStack{
                                        Text("신발")
                                            .foregroundColor(.white)
                                        Image("Shoes_character")
                                            .resizable()
                                            .frame(width: 81, height: 100)
                                    }

                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 160, height: 100)
                                        .foregroundColor(.stodGray200)
                                    HStack{
                                        Text("패션잡화")
                                            .foregroundColor(.white)
                                        Image("Cap_character")
                                            .resizable()
                                            .frame(width: 79, height: 95)
                                    }

                                }
                            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            Spacer()
                        }.padding(EdgeInsets(top:0, leading: 16, bottom: 0, trailing: 16))
                    }
        VStack {
            Text("옷의 카테고리를 선택해주세요")
            ForEach(MainCategory.allCases, id: \.self) { category in
                Button(action: {
                    selectedMainCategory = category
                    selectedSubCategory = category.rawValue
                }) {
                    Text(category.rawValue)
                        .foregroundColor(selectedMainCategory == category ? .yellow : .primary)
                }
            }
            
            Text("It's a third page")
            Text("옷 종류를 알려주세요")
            
            if let selectedMainCategory = selectedMainCategory {
                ForEach(selectedMainCategory.subcategories, id: \.self) { subcategory in
                    Button(action: {
                        selectedSubCategory = subcategory
                        newCloth.selectedSubCategory = subcategory
                        newCloth.selectedMainCategory = selectedMainCategory.rawValue
                    }) {
                        Text(subcategory)
                            .foregroundColor(selectedSubCategory == subcategory ? .yellow : .primary)
                    }
                }
            }
            
            Text("옷 이름을 알려주세요").font(.title3)
            TextField("", text: $newCloth.name)
            Text("어떤 사이즈를 구매하셨나요?").font(.title3)
            TextField("", text: $newCloth.size)
            
            Button(action: {
                saveCloth()
//                isNavigationActive = true
            }) {
                Text("저장하기")
            }
        }
        .padding()
    }
}


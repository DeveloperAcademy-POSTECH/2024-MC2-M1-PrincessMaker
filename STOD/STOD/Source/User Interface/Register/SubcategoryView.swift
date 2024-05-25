//
//  SubcategoryView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/20/24.
//

import SwiftUI

struct SubcategoryView: View {
    @State var isAnimated: Bool = false
    @State var selectedSubcategory: String?
    @Binding var name: String
    @Binding var size: String
    @Binding var selectedMainCategory: MainCategory
    // 고쳐야 하는 것
    // 3. 현재는 "상의" 카테고리만 가져와서 보이는데 사용자가 선택한 대분류에 해당하는 서브카테고리가 출력되도록
    
    var body: some View {
        
            NavigationStack{
                GeometryReader{ geometry in
                    VStack(alignment: .leading){
                        Text("옷 종류를 알려주세요")
                            .foregroundColor(.white)
                            .font(.StodHeadline)
                            .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 0))
                        
                        
                        if isAnimated {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), alignment: .leading)], alignment: .leading, spacing: 0) {
                                //2차원 형태로 chip들 배치하기 위해 lazyVgrid 사용
                                
                                ForEach(MainCategory.top.subcategories, id: \.self) { subcategory in
                                    //maincategory에서 상의 subcategory 가져옴
                                    
                                    
                                    ZStack {
                                        
                                        Text(subcategory)
                                            .opacity(isAnimated ? 1 : 0)
                                        //subcategory 출력
                                            .font(.StodTitle1)
                                            .foregroundColor(selectedSubcategory == subcategory ? Color.accentColor : Color.stodGray100)
                                        //선택 전에는 회색, 선택되면 노란색으로 바뀜
                                            .padding(.vertical,5)
                                            .padding(.horizontal,10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(selectedSubcategory == subcategory ? Color.accentColor : Color.stodGray100, lineWidth: 1)
                                                    .opacity(isAnimated ? 1 : 0)
                                                
                                                //text 문자열에 맞게 roundedrectangle로 감싸기
                                            )
                                            .onTapGesture {
                                                selectedSubcategory = subcategory
                                            }
                                    }
                                }
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 12, trailing: 16))
                            }
                        }
                        
                        
                        Text("사이즈")
                            .font(.StodBody)
                            .foregroundColor(.stodGray100)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 10, trailing: 16))
                        
                        Text(size)
                            .font(.StodTitle2)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 12, trailing: 16))
                        
                        Rectangle()
                            .fill(Color.stodGray100)
                            .frame(height: 1)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                        
                        
                        Text("이름")
                            .font(.StodBody)
                            .foregroundColor(.stodGray100)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 10, trailing: 16))
                        
                        Text(name)
                            .font(.StodTitle2)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 12, trailing: 16))
                        
                        Rectangle()
                            .fill(Color.stodGray100)
                            .frame(height: 1)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                        
                        Spacer()
                        
                        VStack{
                            
                            NavigationLink(destination: MeasurementView(name: .constant("sample name"), size: .constant("sample size"), selectedSubcategory: .constant("sample sub"))){
                                ZStack {
                                    RoundedRectangle(cornerRadius: 0)
                                        .frame(width: geometry.size.width, height: 48)
                                        .foregroundColor(selectedSubcategory != nil ? Color.accentColor : Color.stodGray100)
                                    
                                    Text("확인")
                                        .font(.StodTitle1)
                                        .foregroundColor(.black)
                                    
                                    
                                }
                            }
                        }
                        .padding(.bottom, 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: geometry.size.height * 0.1)
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.6)) {
                            isAnimated = true
                        }
                    }
            }
        }
    }
}

#Preview {
    SubcategoryView(name: .constant("Sample name"), size: .constant("Sample size"), selectedMainCategory: .constant(.top) )
}

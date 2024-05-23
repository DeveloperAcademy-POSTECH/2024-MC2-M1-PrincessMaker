//
//  MeasurementView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/21/24.
//

import SwiftUI


struct NumericalPhotoView: View {
    @Binding var newCloth: Cloth
    @State private var isAnimated: Bool = false
    @State private var showPicker = false
    @State private var imageData: Data? = nil
    @State private var isActive: Bool = false
    //고쳐야 하는 것
    //1. 서브카테고리 값 받아와서 보여주기
    //3. 등록한 사진 변수에 저장
    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView {
                NavigationLink(destination: MainPhotoView(newCloth: $newCloth), isActive: $isActive){
                    EmptyView()
                }.frame(width: 0, height: 0)
                
                VStack(alignment: .leading){
                    Text("수치 사진을 올려주세요")
                        .foregroundColor(.white)
                        .font(.StodHeadline)
                        .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 0))
                    
                    //imagepicker 가져옴
                    if isAnimated {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.stodGray100, lineWidth: 1)
                                .frame(width: geometry.size.width - 32, height: 192)
                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                            
                            Button {
                                showPicker = true
                            } label : {
                                if let data = imageData {
                                    Image(uiImage: UIImage(data: data)!)
                                        .resizable()
                                        .scaledToFit()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width - 32, height: 192)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.top, 15)
                                } else {
                                    Image(systemName: "photo.badge.plus")
                                        .resizable()
                                        .frame(width: 30, height: 23)
                                        .foregroundColor(.stodGray100)
                                        .padding(.top, 10)
                                }
                            }
                            
                        }
                        
                        //종류 부분
                        Text("종류")
                            .font(.StodBody)
                            .foregroundColor(.stodGray100)
                            .padding(EdgeInsets(top: 24 , leading: 16, bottom: 10, trailing: 16))
                        
                        Text(newCloth.selectedSubCategory)
                            .font(.StodTitle2)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 12, trailing: 16))
                        
                        Rectangle()
                            .fill(Color.stodGray100)
                            .frame(height: 1)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                        
                        //사이즈 부분
                        Text("사이즈")
                            .font(.StodBody)
                            .foregroundColor(.stodGray100)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 10, trailing: 16))
                        
                        Text(newCloth.size)
                            .font(.StodTitle2)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 12, trailing: 16))
                        
                        Rectangle()
                            .fill(Color.stodGray100)
                            .frame(height: 1)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                        
                        //이름 부분
                        Text("이름")
                            .font(.StodBody)
                            .foregroundColor(.stodGray100)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 10, trailing: 16))
                        
                        Text(newCloth.name)
                            .font(.StodTitle2)
                            .padding(EdgeInsets(top: 0 , leading: 16, bottom: 12, trailing: 16))
                        
                        Rectangle()
                            .fill(Color.stodGray100)
                            .frame(height: 1)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                        
                        Spacer()
                        
                        VStack{
                            
                            //확인 버튼 부분
                            Button {
                                newCloth.numericalPhotoData = imageData
                                print(newCloth.numericalPhotoData ?? "No Data")
                                isActive = true
                            } label: {
                                Text("확인")
                                    .font(.StodTitle1)
                                    .foregroundColor(.black)
                                    .frame(height: 48)
                                    .frame(maxWidth: .infinity)
                                    .background(imageData != nil ? Color.accentColor : Color.stodGray100)
                            }
                            .padding(.bottom, 20)
                            .frame(maxWidth: .infinity)
                            .frame(height: geometry.size.height * 0.1)
                            
                            .fullScreenCover(isPresented: $showPicker) {
                                ImageEditPicker(inputImageData: $imageData)
                            }
                            
                            if imageData == nil {  //이미지가 선택되면 아이콘이 없어짐
                                Image(systemName: "photo.badge.plus")
                                    .resizable()
                                    .frame(width: 30, height: 23)
                                    .foregroundColor(.stodGray100)
                                    .padding(.top, 10)
                            }
                        }
                        
                    }
                    
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isAnimated = true
                }
            }
            
            
        }
    }
    
}


////
////  ClothesPhotoView.swift
////  STOD
////
////  Created by SOOKYUNG CHO on 5/22/24.
////
//
//import SwiftUI
//
//struct ClothesPhotoView: View {
//    @State var isAnimated: Bool = false
//    @State var showPicker = false
//    @State var imageData: Data? = nil
//    
//    //해야하는 것
//    //앞에 Measurement랑 동일
//    
//    var body: some View {
//        NavigationStack{
//            GeometryReader{ geometry in
//                VStack(alignment: .leading){
//                    
//                    Text("옷 사진을 올려주세요")
//                        .foregroundColor(.white)
//                        .font(.StodHeadline)
//                        .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 0))
//                    
//                    if isAnimated {
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.stodGray100, lineWidth: 1)
//                                .frame(width: .infinity, height: 192)
//                                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
//                            
//                            Button { //image picker 가져옴
//                                showPicker = true
//                            } label : {
//                                if let data = imageData {
//                                    Image(uiImage: UIImage(data: data)!)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .scaledToFill()
//                                        .frame(width: geometry.size.width - 32, height: 192)
//                                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                                        .padding(.top, 15)
//                                } else {
//                                    Image(systemName: "photo.badge.plus")
//                                        .resizable()
//                                        .frame(width: 30, height: 23)
//                                        .foregroundColor(.stodGray100)
//                                        .padding(.top, 10)
//                                }
//                            }
//                            .fullScreenCover(isPresented: $showPicker) {
//                                ImageEditPicker(inputImageData: $imageData)
//                            }
//                            
//                            if imageData == nil {  //이미지가 선택되면 아이콘이 없어짐
//                                Image(systemName: "photo.badge.plus")
//                                    .resizable()
//                                    .frame(width: 30, height: 23)
//                                    .foregroundColor(.stodGray100)
//                                    .padding(.top, 10)
//                            }
//                        }
//                        
//                    }
//                    Spacer()
//                    
//                    VStack{
//                        
//                        //확인 버튼 부분
//                        NavigationLink(destination: RegisetSuccess(name: .constant("sample name"))){
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 0)
//                                    .frame(width: geometry.size.width, height: 48)
//                                    .foregroundColor(imageData != nil ? Color.accentColor : Color.stodGray100) //이미지 선택되며 확인버튼 노란색으로
//                                
//                                Text("확인")
//                                    .font(.StodTitle1)
//                                    .foregroundColor(.black)
//                                
//                            }
//                        }
//                    }
//                    .padding(.bottom, 20)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: geometry.size.height * 0.1)
//                    
//                    //나중에 할래요 버튼 부분
//                    NavigationLink(destination: RegisetSuccess(name: .constant("sample name"))) {
//                        Text("나중에 할래요")
//                            .font(.StodTitle2)
//                            .foregroundColor(.stodGray100)
//                            .underline()
//                    }
//                    .frame(maxWidth: .infinity) // 버튼을 수평 가운데로 정렬
//                    
//                }
//            }.onAppear {
//                withAnimation(.easeInOut(duration: 0.6)) {
//                    isAnimated = true
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    ClothesPhotoView()
//}

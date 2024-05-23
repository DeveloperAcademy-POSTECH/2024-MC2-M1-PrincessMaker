//
//  MainPhotoView.swift
//  STOD
//
//  Created by 김이예은 on 5/23/24.
//

import SwiftUI
import SwiftData

struct MainPhotoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var newCloth: Cloth
    @State private var isAnimated: Bool = false
    @State private var showPicker = false
    @State private var isActive: Bool = false
    @State var imageData: Data? = nil
    
    private func saveCloth() {
        modelContext.insert(newCloth)
//        dismiss()
    }
    
    var body: some View {
        GeometryReader{ geometry in
            NavigationLink(destination: StartView(newCloth: $newCloth), isActive: $isActive){
                EmptyView()
            }.frame(width: 0, height: 0)
            
            VStack(alignment: .leading){
                
                Text("옷 사진을 올려주세요")
                    .foregroundColor(.white)
                    .font(.StodHeadline)
                    .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 0))
                
                if isAnimated {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.stodGray100, lineWidth: 1)
                            .frame(width: geometry.size.width - 32, height: 192)
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                        
                        Button { //image picker 가져옴
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
                    .fullScreenCover(isPresented: $showPicker) {
                        ImageEditPicker(inputImageData: $imageData)
                    }
                    
                    
                }
                Spacer()
                
                VStack{
                    
                    //확인 버튼 부분
                    Button {
                        newCloth.mainPhotoData = imageData
                        print(newCloth.mainPhotoData ?? "No Data")
                        isActive = true
                        saveCloth()
                    } label: {
                        Text("확인")
                            .font(.StodTitle1)
                            .foregroundColor(.black)
                            .frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .background(imageData != nil ? Color.accentColor : Color.gray)
                    }
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: geometry.size.height * 0.1)
                }
                
                //나중에 할래요 버튼 부분
                
                Button {
                    isActive = true
                    saveCloth()
                } label: {
                    Text("나중에 할래요")
                        .font(.StodTitle2)
                        .foregroundColor(.stodGray100)
                        .underline()
                }.frame(maxWidth: .infinity)
                
            }
        }.onAppear {
            withAnimation(.easeInOut(duration: 0.6)) {
                isAnimated = true
            }
        }
    }
}


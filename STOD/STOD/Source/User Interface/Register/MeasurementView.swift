//
//  MeasurementView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/21/24.
//

import SwiftUI


struct MeasurementView: View {
    @State var isAnimated: Bool = false
    //    @State var showImagePicker = false
    //    @State var selectedUIImage: UIImage?
    //    @State var image: Image?
    
    @Binding var name: String
    @Binding var size: String
    @Binding var selectedSubcategory: String
    
    
    //    func loadImage(){
    //        guard let selectedUIImage = selectedUIImage else { return }
    //        image = Image(uiImage: selectedUIImage)
    //    }
    
    //고쳐야 하는 것
    //1. image picker 구현
    //2. 서브카테고리 값 받아와서 보여주기
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                
                
                Text("수치 사진을 올려주세요")
                    .foregroundColor(.white)
                    .font(.StodHeadline)
                    .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 0))
                
                if isAnimated {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.stodGray100, lineWidth: 1)
                        .frame(width: .infinity, height: 192)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    //                    if let image = image{
                    //                        image
                    //                            .resizable()
                    //                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    //                            .frame(maxWidth: .infinity, maxHeight: 192)
                    //                    } else{
                    //                        Image(systemName: "photo.badge.plus")
                    //                            .resizable()
                    //                            .foregroundColor(.stodGray100)
                    //                            .frame(width: 44, height: 44)
                    //                    }
                    //
                    //                    Button{
                    //                        showImagePicker.toggle()
                    //                    } label: {
                    //                        Text("Image Picker")
                    //                    }
                    //                    .sheet(isPresented: $showImagePicker,
                    //                           onDismiss: loadImage){
                    //                        ImagePicker(selectedImage: $selectedUIImage, inputImageData: .constant(Data()), resultImageData: .constant(Data()))
                    //
                    //                    }
                }
                
                Text("종류")
                    .font(.StodBody)
                    .foregroundColor(.stodGray100)
                    .padding(EdgeInsets(top: 24 , leading: 16, bottom: 10, trailing: 16))
                
                Text(selectedSubcategory)
                    .font(.StodTitle2)
                    .padding(EdgeInsets(top: 0 , leading: 16, bottom: 12, trailing: 16))
                
                Rectangle()
                    .fill(Color.stodGray100)
                    .frame(height: 1)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                
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
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isAnimated = true
                }
            }
        }
    }
}


#Preview {
    MeasurementView(name: .constant("sample name"), size: .constant("sample size"), selectedSubcategory: .constant("sample sub"))
}

//
//  TestVie.swift
//  STOD
//
//  Created by 이윤학 on 5/19/24.
//

import SwiftUI

struct TestView: View {
    @State var showPicker = false
    @State var imageData: Data? = nil
    
    var body: some View {
        Button {
            showPicker = true
        } label : {
            if let data = imageData {
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
            } else {
                Image("ImageEditorBasicImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .background(Color.white)
            }
        }
        .fullScreenCover(isPresented: $showPicker) {
            ImageEditPicker(inputImageData: $imageData)
        }
    }
}

#Preview {
    TestView()
}

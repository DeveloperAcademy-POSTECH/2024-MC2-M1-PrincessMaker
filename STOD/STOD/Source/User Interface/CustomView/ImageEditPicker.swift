//
//  ImageEditPicker.swift
//  STOD
//
//  Created by 이윤학 on 5/19/24.
//

import SwiftUI

struct ImageEditPicker: View {
    @Binding var inputImageData: Data?
    
    @State var resultImageData: Data? = nil
    @State var navigationMove = false
    
    var body: some View {
        NavigationStack {
            ImagePicker(inputImageData: $inputImageData, resultImageData: $resultImageData)
            
                .sheet(isPresented: $navigationMove) { PhotosCrop(inputImageData: $inputImageData, resultImageData: $resultImageData)
                }
                .onChange(of: resultImageData) { _, newValue in
                    if newValue != nil {
                        navigationMove = true
                    }
                }
        }
    }
}

#Preview {
    ImageEditPicker(inputImageData: .constant(nil))
}

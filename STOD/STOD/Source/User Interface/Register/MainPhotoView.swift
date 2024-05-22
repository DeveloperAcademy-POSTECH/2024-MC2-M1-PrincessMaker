//
//  MainPhotoView.swift
//  STOD
//
//  Created by 김이예은 on 5/23/24.
//

import SwiftUI

struct MainPhotoView: View {
    @Binding var newCloth: Cloth
    
    var body: some View {
        if newCloth.numericalPhotoData != nil {
            Image(uiImage: UIImage(data: newCloth.numericalPhotoData!)!)
                .resizable()
                .frame(width: 100)
                .scaledToFit()
        }
        Text("메인포토뷰 임니다")
    }
}



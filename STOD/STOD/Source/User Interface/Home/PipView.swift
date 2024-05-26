//
//  PipView.swift
//  STOD
//
//  Created by kim kanghyeok on 5/26/24.
//

import SwiftUI

struct PipView: View {
    @Binding var selectedCloth: Cloth?
    
    var body: some View {
        ZStack {
            if let uiImage = selectedCloth?.numericalUIImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
                VStack {
                    Spacer()
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width:35, height: 35)
                                .foregroundStyle(.black)
                                .opacity(0.4)
                            Text(selectedCloth?.size ?? "")
                                .foregroundStyle(.white)
                        }
                        .padding(15)
                        Spacer()
                    }
                }
            }
        }
    }
}

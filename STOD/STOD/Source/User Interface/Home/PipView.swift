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
//                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack {
                    Spacer()
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width:100, height: 100)
                                .foregroundStyle(.black)
                                .opacity(0.4)
                            Text(selectedCloth?.size ?? "")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                        .padding(15)
                        Spacer()
                    }
                }
            } else {
                Image(.characterHome)
                    .frame(width: 1280, height: 640)
            }
        }
    }
}

//
//  SizeView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/20/24.
//

import SwiftUI

struct SizeView2: View {
    @State var size: String = ""
    @Binding var name: String
    @State var isAnimated: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Text("어떤 사이즈를 구매하셨나요?")
                    .foregroundColor(.white)
                    .font(.StodHeadline)
                    .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 16))
                
                if isAnimated {
                    TextField("ex) 스몰, XL, 240mm", text: $size)
                        .keyboardType(.default)
                        .font(.StodTitle2)
                        .padding(EdgeInsets(top: 24 , leading: 16, bottom: 0, trailing: 16))
                        .opacity(isAnimated ? 1 : 0)
                    
                    Rectangle()
                                            .fill(Color.stodGray100)
                                            .frame(height: 1)
                                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                                            .opacity(isAnimated ? 1 : 0)
                    
                }
                
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
                                    if !size.isEmpty{
                                        NavigationLink(destination: SubcategoryView()){
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 0)
                                                    .frame(width: 393, height: 48)
                                                    .foregroundColor(.accentColor)
                
                                                Text("확인")
                                                    .font(.StodTitle1)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    } else {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 0)
                                                .frame(width: 393, height: 48)
                                                .foregroundColor(.stodGray100)
                
                                            Text("확인")
                                                .font(.StodTitle1)
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                                .padding(.bottom, 20)
                                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.bottom, 20)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isAnimated = true
                }
            }
            //.animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: $isAnimated)
        }
    }
}


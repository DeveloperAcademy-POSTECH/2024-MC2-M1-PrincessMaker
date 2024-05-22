//
//  SizeView.swift
//  STOD
//
//  Created by 김이예은 on 5/21/24.
//

import SwiftUI

struct SizeView: View {
    @Binding var newCloth: Cloth
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("어떤 사이즈를 구매하셨나요?")
                .foregroundColor(.white)
                .font(.StodHeadline)
                .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 0))
            
            if isAnimated {
                TextField("ex) 스몰, XL, 240mm", text: $newCloth.size)
                    .keyboardType(.default)
                    .font(.StodTitle2)
                    .padding(EdgeInsets(top: 24 , leading: 16, bottom: 0, trailing: 0))
                    .opacity(isAnimated ? 1 : 0)
                
                Rectangle()
                    .fill(Color.stodGray100)
                    .frame(height: 1)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0))
                    .opacity(isAnimated ? 1 : 0)
                
            }
            
            Text("이름")
                .font(.StodBody)
                .foregroundColor(.stodGray100)
                .padding(EdgeInsets(top: 0 , leading: 16, bottom: 10, trailing: 0))
            
            Text(newCloth.name)
                .font(.StodTitle2)
                .padding(EdgeInsets(top: 0 , leading: 16, bottom: 12, trailing: 0))
            
            Rectangle()
                .fill(Color.stodGray100)
                .frame(height: 1)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0))
            Spacer()
            
            VStack{
                if !newCloth.size.isEmpty{
                    NavigationLink(destination: SubcategoryView(newCloth: $newCloth)){
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



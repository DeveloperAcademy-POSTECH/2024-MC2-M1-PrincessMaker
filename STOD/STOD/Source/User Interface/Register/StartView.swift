//
//  StartView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/22/24.
//

import SwiftUI

struct StartView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var name: String
    //@Binding var dismissAll: Bool
    
    var body: some View {
        NavigationStack{
            GeometryReader{ geometry in
                
                VStack{
                    ZStack{
                        Image("rulerLine")
                            .resizable()
                        
                        VStack(alignment: .center){
                            Image("STOD")
                               .padding(.top, 150)
                            
                            Text("등록 완료!")
                                .font(.StodTitle2)
                                .foregroundColor(.stodGray100)
                                .padding(.bottom, 12)
                                .padding(.top, 100)
                            
                            Text("\(name)")
                                .font(.StodHeadline)
                            Text("쇼핑을 시작합니다!")
                                .font(.StodHeadline)
                            
                            Spacer()
                            
                            VStack{
                                
                                //확인 버튼 부분
                                Button {
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 0)
                                            .frame(width: geometry.size.width, height: 48)
                                            .foregroundColor(.accentColor) //이미지 선택되며 확인버튼 노란색으로
                                        
                                        Text("확인")
                                            .font(.StodTitle1)
                                            .foregroundColor(.black)
                                        
                                    }
                                }
                            }
                            .padding(.bottom, 20)
                            .frame(maxWidth: .infinity)
                            .frame(height: geometry.size.height * 0.1)
                        }
                        
                    }
                }
               
            }
        }
       
    }
}

#Preview {
    StartView(name: .constant("sample name"))
}

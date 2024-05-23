//
//  StartView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/22/24.
//

import SwiftUI

struct StartView: View {
    @Binding var newCloth: Cloth
    
    var body: some View {
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
                        
                        Text(newCloth.name)
                            .font(.StodHeadline)
                            .foregroundColor(.stodWhite)
                        Text("쇼핑을 시작합니다!")
                            .font(.StodHeadline)
                            .foregroundColor(.stodWhite)
                        
                        Spacer()
                        
                        VStack{
                            
                            //확인 버튼 부분
                            NavigationLink(destination: ContentView()){
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


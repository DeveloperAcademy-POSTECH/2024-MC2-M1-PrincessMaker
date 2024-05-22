//
//  BigCategory.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//

import SwiftUI

struct BigCategory: View {
    @State var selectedMainCategory: MainCategory = .상의
    var body: some View {
        
        
        //view에서 margin 설정 어떻게 하는지?
        //텍스트 위치 마음대로 바꾸고 싶은데 어떻게 할지?
        //캐릭터 asset에 추가?
        
        //big category에 값이 들어오면 다음 뷰로 넘어가도록
        NavigationStack{
            NavigationLink(destination: NameView(selectedMainCategory: $selectedMainCategory)){
                VStack(alignment: .leading){
                    Text("옷의 카테고리를 선택해주세요")
                        .font(.StodHeadline)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 16))
                        
                    
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 160, height: 100)
                                .foregroundColor(.stodGray200)
                            HStack{
                                Text("아우터")
                                    .foregroundColor(.white)
                                Image("Outer_character")
                                    .resizable()
                                    .frame(width: 82, height: 95)
                            }

                        }
                                                
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 160, height: 100)
                                .foregroundColor(.stodGray200)
                            HStack{
                                Text("상의")
                                    .foregroundColor(.white)
                                Image("Clothes_character")
                                    .resizable()
                                    .frame(width: 71, height: 98)
                            }

                        }
                    }.padding(EdgeInsets(top: 80, leading: 16, bottom: 40, trailing: 16))
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 160, height: 100)
                                .foregroundColor(.stodGray200)
                            HStack{
                                Text("하의")
                                    .foregroundColor(.white)
                                Image("Pants_character")
                                    .resizable()
                                    .frame(width: 64, height: 83)
                            }

                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 160, height: 100)
                                .foregroundColor(.stodGray200)
                            HStack{
                                Text("원피스")
                                    .foregroundColor(.white)
                                Image("Onepiece_character")
                                    .resizable()
                                    .frame(width: 65, height: 88)
                            }

                        }
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 40, trailing: 16))
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 160, height: 100)
                                .foregroundColor(.stodGray200)
                            HStack{
                                Text("신발")
                                    .foregroundColor(.white)
                                Image("Shoes_character")
                                    .resizable()
                                    .frame(width: 81, height: 100)
                            }

                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 160, height: 100)
                                .foregroundColor(.stodGray200)
                            HStack{
                                Text("패션잡화")
                                    .foregroundColor(.white)
                                Image("Cap_character")
                                    .resizable()
                                    .frame(width: 79, height: 95)
                            }

                        }
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    Spacer()
                }.padding(EdgeInsets(top:0, leading: 16, bottom: 0, trailing: 16))
            }
        }
    }
}

#Preview {
    BigCategory()
}

//
//  BigCategory.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//

import SwiftUI

struct BigCategory: View {
    var body: some View {
       
        //view에서 margin 설정 어떻게 하는지?
        //텍스트 위치 마음대로 바꾸고 싶은데 어떻게 할지?
        //캐릭터 asset에 추가?
        
        //big category에 값이 들어오면 다음 뷰로 넘어가도록
            VStack{
                Text("옷의 카테고리를 선택해주세요")
                    .font(.StodHeadline)
                
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 160, height: 100)
                            .foregroundColor(.stodGray200)
                        Text("아우터")
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 160, height: 100)
                            .foregroundColor(.stodGray200)
                        Text("상의")
                    }
                }
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 160, height: 100)
                            .foregroundColor(.stodGray200)
                        Text("하의")
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 160, height: 100)
                            .foregroundColor(.stodGray200)
                        Text("원피스")
                    }
                }
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 160, height: 100)
                            .foregroundColor(.stodGray200)
                        Text("신발")
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 160, height: 100)
                            .foregroundColor(.stodGray200)
                        Text("패션잡화")
                    }
                }
                
            }.padding(EdgeInsets(top:0, leading: 16, bottom: 0, trailing: 16))
      
            
    }
}

#Preview {
    BigCategory()
}

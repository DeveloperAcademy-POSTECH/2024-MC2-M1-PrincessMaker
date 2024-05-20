//
//  NameView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//

import SwiftUI

struct NameView: View {
    var body: some View {
        //ex 입력하면 없어지도록
        //키보드 위로 올라와있게
        //사용자가 치기 시작하면 확인 버튼 뜨도록
        NavigationStack{
            VStack(alignment: .leading){
                Text("옷 이름을 알려주세요")
                    .font(.StodHeadline)
                Text("ex) 똥싼바지, 여리여리 블라우스")
                    .font(.StodTitle2)
                Divider()
                    .foregroundColor(.white)

            }
        }
    }
}

#Preview {
    NameView()
}

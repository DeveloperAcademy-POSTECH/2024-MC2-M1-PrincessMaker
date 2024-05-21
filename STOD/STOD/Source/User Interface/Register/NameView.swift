//
//  NameView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//

import SwiftUI
import Combine

struct NameView: View {
    @State var name: String = ""
    
    var body: some View {
        //키보드 위로 올라와있게
        //사용자가 치기 시작하면 확인 버튼 뜨도록
        NavigationStack{
            
            VStack(alignment: .leading){
                Text("옷 이름을 알려주세요")
                    .foregroundColor(.white)
                    .font(.StodHeadline)
                    .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 16))
                
                TextField("ex) 똥싼바지, 여리여리 블라우스", text: $name)
                    .keyboardType(.default)
                    .font(.StodTitle2)
                    .padding(EdgeInsets(top: 24 , leading: 16, bottom: 0, trailing: 16))
                
                Rectangle()
                    .fill(Color.stodGray100)
                    .frame(height: 1)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 16))
                
                Spacer()
                
                
                VStack {
                    if !name.isEmpty {
                        NavigationLink(destination: SizeView(name: $name)) {
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
            
        }
    }
    
}






#Preview {
    NameView()
}

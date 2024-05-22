//
//  NameView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//

import SwiftUI
import Combine

struct NameView: View {
    @Binding var newCloth: Cloth
    
    var body: some View {
        VStack(alignment: .leading){
            Text("옷 이름을 알려주세요")
                .foregroundColor(.white)
                .font(.StodHeadline)
                .padding(EdgeInsets(top: 54, leading: 16, bottom: 0, trailing: 0))
            
            TextField("ex) 똥싼바지, 여리여리 블라우스", text: $newCloth.name)
                .keyboardType(.default)
                .font(.StodTitle2)
                .padding(EdgeInsets(top: 24 , leading: 16, bottom: 0, trailing: 0))
                .onAppear{
                    UITextField.appearance().clearButtonMode = .whileEditing
                }
            
            Rectangle()
                .fill(Color.stodGray100)
                .frame(height: 1)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 24, trailing: 0))
            
            Spacer()
            
            
            VStack {
                if !newCloth.name.isEmpty {
                    NavigationLink(destination: SizeView(newCloth: $newCloth)) {
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








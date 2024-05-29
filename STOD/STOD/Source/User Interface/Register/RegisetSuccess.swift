//
//  StartView.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/22/24.
//

import SwiftUI

struct RegisetSuccess: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var name: String
    @Binding var showRegisterView: Bool
    
    var body: some View {
        VStack{
            ZStack {
                Image(.rulerLine)
                    .resizable()
                
                VStack(alignment: .center){
                    Spacer()
                    
                    Image(.colorCharacter)
                    
                    Spacer().frame(height: 130)
                    
                    Text("\(name)")
                        .font(.StodHeadline)
                    Text("등록을 완료했습니다!")
                        .font(.StodHeadline)
                    
                    Spacer()
                    
                    VStack{
                        Button {
                            showRegisterView = false
                        } label: {
                            HStack {
                                Spacer()
                                Text("확인")
                                    .font(.StodTitle1)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.vertical, 15)
                            .background {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(.accent)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
    
}

#Preview {
    RegisetSuccess(name: .constant("sample name"), showRegisterView: .constant(false))
}

//
//  Register.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI

struct Register: View {
    var body: some View {
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
    }
}

#Preview {
    Register()
}

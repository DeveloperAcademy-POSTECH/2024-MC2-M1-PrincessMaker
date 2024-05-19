//
//  Onboarding.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button(action: {
            firstLaunch = false
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
        })
        //해당 버튼은 온보딩을 닫는 버튼으로 사용하거나 하면 될 것 같습니다. 굳이 버튼이 아니더라도 firstLaunch의 값을 바꿀 수 있다면 뭐든 가능할 듯 싶습니다. 뷰를 다 그리셨다면 주석을 지우셔도 무방합니다.
    }
}

#Preview {
    Onboarding()
}

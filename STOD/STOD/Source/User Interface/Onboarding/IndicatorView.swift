//
//  IndicatorVIew.swift
//  STOD
//
//  Created by hannback on 5/20/24.
//

import SwiftUI

struct IndicatorView: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        HStack {
             ForEach(0..<3) { index in
                 Circle()
                     .fill(index == tabSelection ? Color.accentColor : Color.stodGray100)
                     .frame(width: 10, height: 10)
                     .onTapGesture {
                         tabSelection = index
                     }
             }
         }
         .padding(.top, 24)
         .padding(.bottom, 74)
     }
 }

//#Preview {
//    @State var currentPage = 0
//    return IndicatorView(currentPage: $currentPage)
//}

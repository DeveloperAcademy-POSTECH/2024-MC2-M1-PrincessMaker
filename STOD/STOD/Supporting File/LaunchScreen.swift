//
//  LaunchScreen.swift
//  STOD
//
//  Created by cheon on 5/20/24.
 //

 import SwiftUI
 import Lottie

 struct LaunchScreen: View {
     var body: some View {
         VStack{
             LottieView(animation:
                     .named("Splash_Black"))
             .looping()
             .resizable()
             .scaledToFill()
             .frame(width: 343, height: 200)
             .clipped()
             Text("쉽게 비교하자, STOD")
                 .font(.StodHeadline)
                 .bold()
                 .multilineTextAlignment(.center)

     }
         .padding(.bottom,100)
     }
 }


 #Preview {
     LaunchScreen()
 }

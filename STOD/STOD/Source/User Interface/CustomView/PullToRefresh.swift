
//  PullToRefresh.swift

//  STOD

//

//  Created by SOOKYUNG CHO on 5/22/24.

//

import SwiftUI

struct PullToRefreshView: View {
    
    @State private var isRefreshing = false
    
    @State private var showAlternativeView = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                if showAlternativeView {
                    
                    AlternativeView()
                    
                } else {
                    
                    List(0..<10) { index in
                        Text("Item \(index)")
                        
                    }
                    
                    .refreshable {
                        
                        await refresh()
                        
                    }
                    
                }
                
            }
            
            //.navigationTitle("Pull to Refresh")
            
        }
        
    }
    
    private func refresh() async {
        
        // Pull to refresh가 호출되었을 때 2초 지연 후 다른 뷰를 표시
        
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        
        withAnimation {
            
            showAlternativeView = true
            
        }
        
    }
    
}

struct AlternativeView: View {
    
    @State var selectedMainCategory: MainCategory = .상의
    
    var body: some View {
        
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

struct PullToRefresh_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PullToRefreshView()
        
    }
    
}

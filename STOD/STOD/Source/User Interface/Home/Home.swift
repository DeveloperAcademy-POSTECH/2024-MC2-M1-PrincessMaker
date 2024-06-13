//
//  Home.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import SwiftUI
import SwiftData
import UIPiPView

struct Home: View {
    @Environment(\.modelContext) private var modelContext
    @Query var clothes: [Cloth]
    
    @AppStorage("firstPIP") var firstPIP: Bool = true
    @State private var selectedCategory: MainCategory = .recent
    @State var showRegisterView: Bool = false
    @State private var selectedCloth: Cloth? = nil
    @State private var showPIP: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            UIPIPView(showPipView: $showPIP,
                      selectedCloth: $selectedCloth,
                      showRegisterView: $showRegisterView)
            .frame(width: UIScreen.main.bounds.width-32, height: (UIScreen.main.bounds.width-32)/4*3)
            Color.black
                .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.width-32)/4*3)
            VStack(spacing: 0) {
                PIPSection()
                Spacer().frame(height: 24)
                CategorySection(selectedCategory: $selectedCategory,
                                isOnlyTap: false)
                Spacer().frame(height: 15)
                ClothList(selectedCategory: $selectedCategory,
                          showRegisterView: $showRegisterView,
                          selectedCloth: $selectedCloth,
                          showPIP: $showPIP)
                
            }
            
            if firstPIP && (selectedCloth != nil) && showPIP {
                firstPIPGuidingView
            }
        }
        .fullScreenCover(isPresented: $showRegisterView) {
            RegisterMainCategory()
        }
        .onChange(of: showPIP) { oldValue, newValue in
            print(showPIP)
        }
        .animation(.easeInOut(duration: 0.2), value: firstPIP)
    }
}

extension Home {
    var firstPIPGuidingView: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: (UIScreen.main.bounds.width-32)/4*3)
            Spacer()
            Image(.firstPIPMessage)
            Spacer()
            
            Button {
                firstPIP = false
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
            .padding(16)
        }
        .background {
            BackdropBlurView(radius: 5)
        }
        .background {
            Color.stodBlack.opacity(0.6)
        }
    }
}

#Preview {
    Home()
}


//SwiftData 프리뷰
//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Cloth.self, configurations: config)
//
//    for i in 1..<10 {
//        let cloth = Cloth(name: "Helllo", size: "S", numericalImageData: nil, clothImageData: nil, subCategory: "후드티", mainCategory: "상의", isPinned: false)
//        container.mainContext.insert(cloth)
//    }
//
//    return Home()
//        .modelContainer(container)
//}
/// A View in which content reflects all behind it
struct BackdropView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView()
        let blur = UIBlurEffect()
        let animator = UIViewPropertyAnimator()
        animator.addAnimations { view.effect = blur }
        animator.fractionComplete = 0
        animator.stopAnimation(false)
        animator.finishAnimation(at: .current)
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
    
}

/// A transparent View that blurs its background
struct BackdropBlurView: View {
    
    let radius: CGFloat
    
    @ViewBuilder
    var body: some View {
        BackdropView().blur(radius: radius, opaque: true)
    }
}

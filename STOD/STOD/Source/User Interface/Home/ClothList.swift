//
//  ClothList.swift
//  STOD
//
//  Created by 이윤학 on 5/23/24.
//

import SwiftUI
import SwiftData

struct ClothList: View {
    let selectedCategory: MainCategory
    
    @Environment(\.modelContext) private var modelContext
    @Query var clothes: [Cloth]
    @Binding var showRegisterView: Bool
    @Binding var selectedCloth: Cloth?
    
    var body: some View {
        List {
            if filteredClothes.isEmpty {
                HStack {
                    Spacer()
                    Image(.emptyList)
                    Spacer()
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                .background(.stodBlack)
            }
            
            ForEach(filteredClothes) { cloth in
                ClothRow(selectedCategory: selectedCategory, cloth: cloth, selectedCloth: $selectedCloth)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .contextMenu(
                        ContextMenu(menuItems: {
                            Button {
                                
                            } label: {
                                Label(cloth.isPinned ? "고정 해제" : "고정", systemImage: cloth.isPinned ? "pin.slash" : "pin")
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }
                            
                            Button(role: .destructive){
                                
                            } label: {
                                Label("삭제", systemImage: "trash")
                                    .font(.subheadline)
                            }
                        }))
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive){
                            
                        } label: {
                            Label("Trash", systemImage: "trash")
                                .font(.subheadline)
                        }
                        .tint(.red)
                        
                        Button {
                            
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        .tint(.orange)
                        
                        Button {
                            
                        } label: {
                            Label("pin", systemImage: cloth.isPinned ? "pin.slash" : "pin")
                        }
                        .tint(.stodGray100)
                    }
                    .background(.stodBlack)
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .animation(.linear(duration: 0.3), value: clothes)
        .refreshable {
            await refresh()
            
        }
        .background(.stodBlack)
    }
    
    private func refresh() async {
        // Pull to refresh가 호출되었을 때 0.5초 지연 후 다른 뷰를 표시
        try? await Task.sleep(nanoseconds: 1 * 500_000_000)
        showRegisterView = true
    }
    
    var filteredClothes: [Cloth] {
        if selectedCategory == .recent {
            let clothes = clothes.sorted{ $0.date > $1.date}
            
            if clothes.count > 10 {
                return Array(clothes[0..<10])
            } else {
                return clothes
            }
        } else {
            return clothes
                .filter{ $0.mainCategory == selectedCategory.rawValue }
                .sorted {
                    if $0.isPinned == $1.isPinned {
                        return $0.name < $1.name
                    } else if $0.isPinned {
                        return true
                    } else {
                        return false
                    }
                }
        }
    }
}

#Preview {
    ClothList(selectedCategory: .top, showRegisterView: .constant(false), selectedCloth: .constant(SampleCloth.contents[0]))
}

//struct Cloth: Identifiable {
//    var id: UUID = UUID()
//    var mainCategory: [MainCategory] = [.top]
//    var imageName: String = "CharacterHome"
//    var title: String = "완벽한 핏 니트"
//    var size: String = "스몰"
//    var subCategory: String = "니트"
//    var isPinned: Bool = false
//    var isSelected: Bool = false
//    var date: Date = Date().addingTimeInterval(-500)
//
//    static var dummy: [Cloth] = [
//
//        Cloth(mainCategory: [.top], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-500)),
//        Cloth(mainCategory: [.top], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: true, date: Date().addingTimeInterval(-400)),
//        Cloth(mainCategory: [.top], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-300)),
//        Cloth(mainCategory: [.top], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-200)),
//        Cloth(mainCategory: [.top], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-100)),
//
//        Cloth(mainCategory: [.bottom], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-501)),
//        Cloth(mainCategory: [.bottom], title: "편한 후드", size: "라지라지", subCategory: "배기팬츠", isPinned: true, date: Date().addingTimeInterval(-401)),
//        Cloth(mainCategory: [.bottom], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-301)),
//        Cloth(mainCategory: [.bottom], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-201)),
//        Cloth(mainCategory: [.bottom], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-101)),
//        Cloth(mainCategory: [.bottom], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(1)),
//
//
//        Cloth(mainCategory: [.onepiece], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-502)),
//        Cloth(mainCategory: [.onepiece], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: true, date: Date().addingTimeInterval(-402)),
//        Cloth(mainCategory: [.onepiece], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-302)),
//        Cloth(mainCategory: [.onepiece], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-202)),
//        Cloth(mainCategory: [.onepiece], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-102)),
//
//        Cloth(mainCategory: [.accessory], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-503)),
//        Cloth(mainCategory: [.accessory], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: true, date: Date().addingTimeInterval(-403)),
//        Cloth(mainCategory: [.accessory], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: true, date: Date().addingTimeInterval(-303)),
//        Cloth(mainCategory: [.accessory], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-203)),
//        Cloth(mainCategory: [.accessory], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-103)),
//
//        Cloth(mainCategory: [.outer], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-504)),
//        Cloth(mainCategory: [.outer], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: true, date: Date().addingTimeInterval(-404)),
//        Cloth(mainCategory: [.outer], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-304)),
//        Cloth(mainCategory: [.outer], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-204)),
//        Cloth(mainCategory: [.outer], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-104)),
//
//        Cloth(mainCategory: [.shoes], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-505)),
//        Cloth(mainCategory: [.shoes], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: true, date: Date().addingTimeInterval(-405)),
//        Cloth(mainCategory: [.shoes], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: true, date: Date().addingTimeInterval(-305)),
//        Cloth(mainCategory: [.shoes], title: "편한 후드티", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-205)),
//        Cloth(mainCategory: [.shoes], title: "똥싼 바지", size: "라지라지", subCategory: "배기팬츠", isPinned: false, date: Date().addingTimeInterval(-105)),
//    ]
//}

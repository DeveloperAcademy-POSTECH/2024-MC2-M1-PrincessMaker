//
//  ClothList.swift
//  STOD
//
//  Created by 이윤학 on 5/23/24.
//

import SwiftUI
import SwiftData

struct ClothList: View {
    @Environment(\.modelContext) private var modelContext
    @Query var clothes: [Cloth]
    @Binding var selectedCategory: MainCategory
    @Binding var showRegisterView: Bool
    @Binding var selectedCloth: Cloth?
    @Binding var showPIP: Bool
    @State var isRefreshing: Bool = false
    @State var isEditing: Bool = false
    @State var editTargetIndex: Int = 0
    @State var isDeleting: Bool = false
    @State var deleteTargetIndex: Int = 0
    var swipeText = "스크롤을 당겨서\n옷을 추가할 수 있어요"
    
    var body: some View {
        List {
            if filteredClothes.isEmpty {
                HStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 16) {
                        Image(systemName: "arrow.down")
                            .foregroundColor(.stodGray100)
                            .padding(.top, 47)
                        Text(LocalizedStringKey("swipeText"))
                            .font(.StodTitle1)
                            .foregroundColor(.stodGray100)
                            .multilineTextAlignment(.center)
                    }
//                    Image(.emptyList)
                    Spacer()
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            
            ForEach(filteredClothes) { cloth in
                ClothRow(selectedCategory: selectedCategory, cloth: cloth, selectedCloth: $selectedCloth, showPIP: $showPIP)
                    .listRowInsets(EdgeInsets())
                    .contextMenu(
                        ContextMenu(menuItems: {
                            PinButton(cloth: cloth)
                            EditButton(cloth: cloth)
                            DeleteButton(cloth: cloth)
                        }))
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        DeleteButton(cloth: cloth)
                            .tint(.red)
                        EditButton(cloth: cloth)
                            .tint(.orange)
                        PinButton(cloth: cloth)
                            .tint(.stodGray100)
                    }
                    .listRowSeparator(.hidden)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .animation(.linear(duration: 0.3), value: clothes)
        .refreshable {
            withAnimation {
                isRefreshing = true
            }
            await refresh()
            withAnimation {
                isRefreshing = false
            }
        }
        .sheet(isPresented: $isEditing, content: {
            UpdateView(targetIndex: $editTargetIndex)
        })
        .confirmationDialog("이 항목이 삭제됩니다.", isPresented: $isDeleting, titleVisibility: .visible) {
            Button("삭제", role: .destructive) { IndexSet(integer: deleteTargetIndex).map { clothes[$0] }.forEach(modelContext.delete) }
        }
        .overlay(alignment: .top) {
            if isRefreshing {
                HStack {
                    Spacer()
                    Image(systemName: "plus")
                        .font(.StodHeadline)
                    //.font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.stodGray100)
                    Spacer()
                }
                .padding()
                .background(.stodBlack)
                //.padding(.top, 24)
            }
        }
        
    }
}

extension ClothList {
    private func DeleteButton(cloth: Cloth) -> some View {
        Button(role: .destructive){
            deleteCloth(cloth: cloth)
        } label: {
            Label("삭제", systemImage: "trash")
                .font(.subheadline)
        }
    }
    
    private func EditButton(cloth: Cloth) -> some View {
        Button {
            updateCloth(cloth: cloth)
        } label: {
            Label("수정", systemImage: "pencil")
        }
    }
    
    private func PinButton(cloth: Cloth) -> some View {
        Button {
            pinCloth(cloth: cloth)
        } label: {
            Label(cloth.isPinned ? "고정 해제" : "고정", systemImage: cloth.isPinned ? "pin.slash" : "pin")
        }
    }
    
    private func deleteCloth(cloth: Cloth) {
        if let index = clothes.firstIndex(where: { $0.id == cloth.id }) {
            withAnimation {
                deleteTargetIndex = index
                isDeleting = true
            }
        }
    }
    
    private func pinCloth(cloth: Cloth) {
        if let index = clothes.firstIndex(where: { $0.id == cloth.id }) {
            withAnimation {
                clothes[index].isPinned.toggle()
            }
        }
    }
    
    private func updateCloth(cloth: Cloth) {
        if let index = clothes.firstIndex(where: { $0.id == cloth.id }) {
            editTargetIndex = index
            isEditing = true
        }
    }
    
    private func refresh() async {
        // Pull to refresh가 호출되었을 때 0.5초 지연 후 다른 뷰를 표시
        try? await Task.sleep(nanoseconds: 1 * 300_000_000)
        showRegisterView = true
    }
    
    private var filteredClothes: [Cloth] {
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

//#Preview {
//    ClothList(selectedCategory: .top, filteredClothes: [], showRegisterView: .constant(false), selectedCloth: .constant(nil))
//}

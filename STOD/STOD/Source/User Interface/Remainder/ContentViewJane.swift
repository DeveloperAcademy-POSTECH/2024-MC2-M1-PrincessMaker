////
////  ContentView.swift
////  STOD
////
////  Created by 김이예은 on 5/19/24.
////
//
//import SwiftUI
//import SwiftData
//
//struct ContentViewJane: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query var clothes: [Cloth]
//    @State private var isUpdatingNewCloth = false
//    @State private var newCloth = Cloth(name: "", size: "", numericalPhotoPath: nil, mainPhotoPath: nil, selectedSubCategory: "", selectedMainCategory: "", isPinned: false)
//    @State private var selectedCloth: Cloth = Cloth(name: "", size: "", numericalPhotoPath: nil, mainPhotoPath: nil, selectedSubCategory: "", selectedMainCategory: "", isPinned: false)
//    @State private var selectedIndex: Int? = nil
//    
//    public func deleteCloth(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { clothes[$0] }.forEach(modelContext.delete)
//        }
//    }
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(clothes, id: \.self) { cloth in
//                    VStack {
//                        HStack {
//                            Text(cloth.name)
//                                .bold()
//                            Text(cloth.size)
//                                .foregroundStyle(.blue)
//                            Text(cloth.selectedSubCategory)
//                                .foregroundStyle(.yellow)
//                        }
//                    }
//                    .contextMenu {
//                        Button(action: {
//                            // 고정 기능 구현
//                        }) {
//                            Text("고정")
//                        }
//                        Button(action: {
//                            if let index = clothes.firstIndex(where: { $0.id == cloth.id }) {
//                                selectedCloth = clothes[index]
//                            }
////                            selectedCloth = cloth
//                            isUpdatingNewCloth = true
//                            // 수정 기능 구현
//                            print(selectedCloth.name)
//                            print(selectedCloth.size)
//                            print(selectedCloth.selectedSubCategory)
//                            print(selectedCloth.selectedMainCategory)
//                        }) {
//                            Text("수정")
//                        }
//                        Button(action: {
//                            if let index = clothes.firstIndex(where: { $0.id == cloth.id }) {
//                                deleteCloth(offsets: IndexSet(integer: index))
//                            }
//                        }) {
//                            Text("삭제")
//                        }
//                    }
//                    .sheet(isPresented: $isUpdatingNewCloth){
//                        UpdateView(selectedCloth: $selectedCloth)
//                    }
//                }
//                .onDelete(perform: deleteCloth)
//                
//            }
//            .navigationTitle("어떤 옷을 찾고 계신가요? 궁금하네요...")
//            NavigationLink(destination: FirstSubmit(newCloth: $newCloth)) {
//                Label("Add Cloth", systemImage: "plus")
//            }
//        }
//    }
//}

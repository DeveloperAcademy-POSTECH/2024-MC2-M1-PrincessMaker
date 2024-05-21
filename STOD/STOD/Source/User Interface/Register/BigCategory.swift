import SwiftUI
import SwiftData

struct BigCategory: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var newCloth: Cloth
    @State private var isNavigationActive = false
    
    private func saveCloth() {
        modelContext.insert(newCloth)
        newCloth = Cloth(name: "", size: "", numericalPhotoPath: nil, mainPhotoPath: nil, selectedSubCategory: "", selectedMainCategory: "")
        dismiss()
    }
    
    ///대분류를 선택하고, 값을 전달하는 버튼입니다
    private func categoryButton(categoryName name: String, imageName imageName: String) -> some View {
        Button(action: {
            newCloth.selectedMainCategory = name
            isNavigationActive = true
            print(newCloth.selectedMainCategory)
        }, label: {
            HStack(alignment: .top) {
                Text(name)
                    .font(Font.StodTitle1)
                    .foregroundColor(.white)
                    .padding(.top, 18)
                    .padding(.leading, 12)
                Spacer()
                Image(imageName)
                    .resizable()
                    .frame(width: 81, height: 93)
                    .padding(.top, 4)
            }
            .frame(width: 160, height: 100)
        }).background(.stodGray200)
            .cornerRadius(10)
    }
    
    var body: some View {
        NavigationLink(destination: NameView(newCloth: $newCloth), isActive: $isNavigationActive) {
            EmptyView()
        }.frame(width: 0, height: 0)
        
        VStack(alignment: .leading) {
            Text("옷의 카테고리를 선택해주세요")
                .font(.StodHeadline)
                .foregroundColor(.white)
//                .padding(.top,54)
//                .padding(.bottom, 80)
            Spacer()
            HStack{
                categoryButton(categoryName: "아우터", imageName: "Outer_character")
                Spacer()
                categoryButton(categoryName: "상의", imageName: "Clothes_character")
            }.padding(.bottom, 40)
            
            HStack{
                categoryButton(categoryName: "하의", imageName: "Pants_character")
                Spacer()
                categoryButton(categoryName: "원피스", imageName: "Onepiece_character")
            }.padding(.bottom, 40)
            
            HStack{
                categoryButton(categoryName: "신발", imageName: "Shoes_character")
                Spacer()
                categoryButton(categoryName: "패션잡화", imageName: "Cap_character")
            }.padding(.bottom)
            
            Spacer()
            
        }.padding()
    }
}


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
                    Spacer()
                    Image(imageName)
                        .resizable()
                        .frame(width: 71, height: 98)
                        .padding(.top, 4)
                }.frame(width: 160, height: 100)
                .padding(.horizontal, 12)
        }).background(.stodGray200)
            .cornerRadius(10)
    }
    
    var body: some View {
        HStack(alignment: .top){
            NavigationLink(destination: NameView(newCloth: $newCloth), isActive: $isNavigationActive) {
                EmptyView()
            }
            
            VStack(alignment: .leading) {
                Text("옷의 카테고리를 선택해주세요")
                    .font(.StodHeadline)
                    .foregroundColor(.white)
                    .padding(.top,16)
                
                HStack{
                    categoryButton(categoryName: "상의", imageName: "Clothes_character")
                    categoryButton(categoryName: "아우터", imageName: "Outer_character")
                }.padding(.bottom, 40)
                HStack{
                    categoryButton(categoryName: "하의", imageName: "Pants_character")
                    categoryButton(categoryName: "원피스", imageName: "Onepiece_character")
                }.padding(.bottom, 40)
                HStack{
                    categoryButton(categoryName: "신발", imageName: "Shoes_character")
                    categoryButton(categoryName: "패션잡화", imageName: "Cap_character")
                }.padding(.bottom)
            }
            .padding(.horizontal, 16)
        }
        }
}


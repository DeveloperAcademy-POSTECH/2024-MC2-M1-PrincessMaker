import SwiftUI

struct SubcategoryView: View {
    @Binding var newCloth: Cloth
    @State private var selectedSubCategory: String?
    @State private var isAnimated: Bool = false
    
    private var subcategories: [String] {
        guard let mainCategory = MainCategory(rawValue: newCloth.selectedMainCategory) else {
            return []
        }
        return mainCategory.subcategories
    }
    
    private func calculateButtonWidth(text: String, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width) + 20
    }
    
    private func layoutButtons(in width: CGFloat) -> [[String]] {
        var rows: [[String]] = [[]]
        var currentRowWidth: CGFloat = 0
        let padding: CGFloat = 10
        let font = UIFont.systemFont(ofSize: 17)
        
        for subcategory in subcategories {
            let buttonWidth = calculateButtonWidth(text: subcategory, font: font)
            if currentRowWidth + buttonWidth + padding > width {
                rows.append([subcategory])
                currentRowWidth = buttonWidth
            } else {
                rows[rows.count - 1].append(subcategory)
                currentRowWidth += buttonWidth + padding
            }
        }
        
        return rows
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading){
                    Text("옷 종류를 알려주세요")
                        .foregroundColor(.white)
                        .font(.StodHeadline)
                        .padding(.top, 54)
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(layoutButtons(in: geometry.size.width), id: \.self) { row in
                            HStack {
                                ForEach(row, id: \.self) { subcategory in
                                    Button(action: {
                                        selectedSubCategory = subcategory
                                        newCloth.selectedSubCategory = subcategory
                                        print(newCloth.selectedSubCategory)
                                    }) {
                                        Text(subcategory)
                                            .lineLimit(1)
                                            .fixedSize(horizontal: true, vertical: false)
                                            .font(.StodTitle1)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .foregroundColor(selectedSubCategory == subcategory ? Color.accentColor : Color.stodGray100)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(selectedSubCategory == subcategory ? Color.accentColor : Color.stodGray100, lineWidth: 1)
                                                    .opacity(isAnimated ? 1 : 0)
                                            )
                                    }.padding(.vertical, 2)
                                }
                            }
                        }
                    }.padding(.bottom, 12)
                    
                    Text("사이즈")
                        .font(.StodBody)
                        .foregroundColor(.stodGray100)
                        .padding(.bottom, 10)
                    
                    Text(newCloth.size)
                        .font(.StodTitle2)
                        .padding(.bottom, 12)
                    
                    Rectangle()
                        .fill(Color.stodGray100)
                        .frame(height: 1)
                        .padding(.bottom, 24)
                    
                    
                    Text("이름")
                        .font(.StodBody)
                        .foregroundColor(.stodGray100)
                        .padding(.bottom, 10)
                    
                    Text(newCloth.name)
                        .font(.StodTitle2)
                        .padding(.bottom, 12)
                    
                    Rectangle()
                        .fill(Color.stodGray100)
                        .frame(height: 1)
                        .padding(.bottom, 24)
                    
                    Spacer()
                    
                    VStack{
                        
                        NavigationLink(destination: NumericalPhotoView(newCloth: $newCloth)){
                            ZStack {
                                RoundedRectangle(cornerRadius: 0)
                                    .frame(width: geometry.size.width, height: 48)
                                    .foregroundColor(selectedSubCategory != nil ? Color.accentColor : Color.stodGray100)
                                
                                Text("확인")
                                    .font(.StodTitle1)
                                    .foregroundColor(.black)
                                
                                
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: geometry.size.height * 0.1)
                }
            }
        }.padding(6)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.6)) {
                    isAnimated = true
                }
            }
    }
}
struct SubcategoryView_Previews: PreviewProvider {
    @State static var newCloth = Cloth(name: "", size: "", numericalPhotoData: nil, mainPhotoData: nil, selectedSubCategory: "", selectedMainCategory: "상의", numericalUIImage: nil, mainUIImage: nil)
    
    static var previews: some View {
        SubcategoryView(newCloth: $newCloth)
    }
}

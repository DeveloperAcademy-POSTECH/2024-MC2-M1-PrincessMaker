import SwiftUI

struct ProgressBar: View {
    
    @Binding var progressStage: Int
    
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(0..<StringLiterals.Progress.allCases.count - 1) { stage in
                    Circle()
                        .zIndex(1)
                        .frame(width: 9, height: 9)
                        .foregroundStyle(.accent)
                        .overlay(progressStage <= stage ? Circle().frame(width: 14, height: 14).foregroundStyle(progressStage == stage ? .accent : Color(hex: "#2B2B2B")).opacity(progressStage == stage ? 0.5 : 1) : nil)
                        .overlay(Text(StringLiterals.Progress.allCases[stage].rawValue).font(.StodBody).offset(y: 30).frame(width: 52).foregroundStyle(progressStage == stage ? .white : Color(hex: "#2B2B2B")))
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width / 4, height: 1)
                    .foregroundStyle(progressStage > stage ? .accent : Color(hex: "#2B2B2B"))
            }
            Circle()
                .frame(width: 9, height: 9)
                .foregroundStyle(.accent)
                .overlay(progressStage <= 4 ? Circle().frame(width: 14, height: 14).foregroundStyle(progressStage >= 3 ? .accent : Color(hex:"#2B2B2B")).opacity(progressStage >= 3 ? 0.5 : 1) : nil)
                .overlay(Text(StringLiterals.Progress.allCases[3].rawValue).font(.StodBody).offset(y: 30).frame(width:52).foregroundStyle(progressStage >= 3 ? .white : Color(hex: "#2B2B2B")))
        }
        .padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
        .frame(height: 60, alignment: .top)
    }
}

//#Preview {
//    ProgressBarTest()
//}

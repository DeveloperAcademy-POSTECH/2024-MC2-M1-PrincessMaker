//
//  ImageEditer.swift
//  STOD
//
//  Created by 이윤학 on 5/19/24.
//

import SwiftUI
import BrightroomUI
import BrightroomEngine

struct PhotosCrop: UIViewControllerRepresentable {
    var uiImage: UIImage
    @Environment(\.presentationMode) var presentationMode
    @Binding var resultImage: UIImage?

    func makeUIViewController(context: Context) -> PhotosCropViewController {
        let controller = PhotosCropViewController(imageProvider: .init(image: uiImage))
        
        // 취소 핸들러 설정
        controller.handlers.didCancel = { controller in
            controller.dismiss(animated: true, completion: nil)
        }

        // 완료 핸들러 설정
        controller.handlers.didFinish = { controller in
            controller.dismiss(animated: true) {
                try? controller.editingStack.makeRenderer().render { result in
                    switch result {
                        case .success(let renderedImage):
                            // 성공한 경우, UIImage를 추출하고 resultImage에 할당
                            DispatchQueue.main.async {
                                self.resultImage = renderedImage.uiImage
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        case .failure(let error):
                            // 실패한 경우, 에러 처리
                            print(error.localizedDescription)
                    }
                }
            }
        }

        return controller
    }

    func updateUIViewController(_ uiViewController: PhotosCropViewController, context: Context) {
        // 필요한 경우 여기서 UIViewController를 업데이트
    }
}

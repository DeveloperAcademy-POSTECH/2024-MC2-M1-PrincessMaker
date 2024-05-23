//
//  ImageToVideo.swift
//  STOD
//
//  Created by kim kanghyeok on 5/23/24.
//

import SwiftVideoGenerator
import SwiftUI

class ImageToVideo: ObservableObject {
    
    var urls: String = ""
    
    func convert(_ name: UIImage?) {
        
        if let imageName = name {
            
            VideoGenerator.fileName = "size"
            VideoGenerator.shouldOptimiseImageForVideo = true
            VideoGenerator.videoDurationInSeconds = 600
            VideoGenerator.current.generate(withImages: [imageName], andAudios: [], andType: .single, {progress in
                print(progress)
            }) { result in
                switch result {
                case .success(let url):
                    self.urls = url.absoluteString
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getUrl() -> String {
        if urls != "" {
            return urls
        }
        
        return "URL이 제대로 설정 되지 않았습니다."
    }
    
    
}

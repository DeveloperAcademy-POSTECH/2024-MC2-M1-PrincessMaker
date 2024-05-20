//
//  Item.swift
//  MC2
//
//  Created by 김이예은 on 5/18/24.
//

import Foundation
import UIKit
import SwiftData

@Model
final class Cloth: ObservableObject, Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var size: String
//    @Attribute(.externalStorage)
    var numericalPhotoPath: String?
//    @Attribute(.externalStorage)
    var mainPhotoPath: String?
    var selectedSubCategory: String
    
    init(name: String, size: String, numericalPhotoPath: String?, mainPhotoPath: String?, selectedSubCategory: String) {
        self.id = UUID()
        self.name = name
        self.size = size
        self.numericalPhotoPath = numericalPhotoPath
        self.mainPhotoPath = mainPhotoPath
        self.selectedSubCategory = selectedSubCategory
    }
    
    var numericalUIImage: UIImage? {
            if let path = numericalPhotoPath,
               let image = UIImage(contentsOfFile: path) {
                return image
            }
            return nil
        }
        
        var mainUIImage: UIImage? {
            if let path = mainPhotoPath,
               let image = UIImage(contentsOfFile: path) {
                return image
            }
            return nil
        }
    
    
}

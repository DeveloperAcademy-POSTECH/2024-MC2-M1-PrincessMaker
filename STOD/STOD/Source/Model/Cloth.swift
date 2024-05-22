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
    var numericalPhotoData: Data?
//    @Attribute(.externalStorage)
    var mainPhotoData: Data?
    var selectedSubCategory: String
    var selectedMainCategory: String
    var numericalUIImage: UIImage? {
            if let data = numericalPhotoData,
               let image = UIImage(data: data) {
                return image
            }
            return nil
        }
        
        var mainUIImage: UIImage? {
            if let data = mainPhotoData,
               let image = UIImage(data: data) {
                return image
            }
            return nil
        }
    
    init(name: String, size: String, numericalPhotoData: Data?, mainPhotoData: Data?, selectedSubCategory: String, selectedMainCategory: String, numericalUIImage: UIImage?, mainUIImage: UIImage?) {
        self.id = UUID()
        self.name = name
        self.size = size
        self.numericalPhotoData = numericalPhotoData
        self.mainPhotoData = mainPhotoData
        self.selectedSubCategory = selectedSubCategory
        self.selectedMainCategory = selectedMainCategory
//        self.numericalUIImage = numericalUIImage
//        self.mainUIImage = mainUIImage
    }
}

//class ItemManager: ObservableObject {
//    @Published var items: [MainCategory] = MainCategory.allCases
//}


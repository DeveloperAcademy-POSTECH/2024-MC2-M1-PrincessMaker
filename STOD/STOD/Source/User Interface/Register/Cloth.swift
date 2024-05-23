//
<<<<<<< Updated upstream
//  Cloth.swift
//  STOD
//
//  Created by SOOKYUNG CHO on 5/19/24.
//

//
=======
>>>>>>> Stashed changes
//  Item.swift
//  MC2
//
//  Created by 김이예은 on 5/18/24.
//

import Foundation
import UIKit
import SwiftData

@Model
<<<<<<< Updated upstream
final class Cloth {
=======
final class Cloth: ObservableObject, Identifiable {
>>>>>>> Stashed changes
    @Attribute(.unique) var id: UUID
    var name: String
    var size: String
//    @Attribute(.externalStorage)
<<<<<<< Updated upstream
    var numericalPhotoPath: String?
//    @Attribute(.externalStorage)
    var mainPhotoPath: String?
    var selectedSubCategory: String
    var selectedMainCategory: String
    
    init(name: String, size: String, numericalPhotoPath: String?, mainPhotoPath: String?, selectedSubCategory: String, selectedMainCategory: String) {
        self.id = UUID()
        self.name = name
        self.size = size
        self.numericalPhotoPath = numericalPhotoPath
        self.mainPhotoPath = mainPhotoPath
        self.selectedSubCategory = selectedSubCategory
        self.selectedMainCategory = selectedMainCategory
    }
    
    var numericalUIImage: UIImage? {
            if let path = numericalPhotoPath,
               let image = UIImage(contentsOfFile: path) {
=======
    var numericalPhotoData: Data?
//    @Attribute(.externalStorage)
    var mainPhotoData: Data?
    var selectedSubCategory: String
    var selectedMainCategory: String
    var numericalUIImage: UIImage? {
            if let data = numericalPhotoData,
               let image = UIImage(data: data) {
>>>>>>> Stashed changes
                return image
            }
            return nil
        }
        
        var mainUIImage: UIImage? {
<<<<<<< Updated upstream
            if let path = mainPhotoPath,
               let image = UIImage(contentsOfFile: path) {
=======
            if let data = mainPhotoData,
               let image = UIImage(data: data) {
>>>>>>> Stashed changes
                return image
            }
            return nil
        }
<<<<<<< Updated upstream
}
=======
    
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
>>>>>>> Stashed changes

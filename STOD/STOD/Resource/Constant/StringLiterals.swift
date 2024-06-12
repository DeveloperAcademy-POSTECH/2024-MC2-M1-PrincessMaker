//
//  StringLiterals.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import Foundation

enum StringLiterals {
    enum Register: String, CaseIterable {
        case nameTitle = "옷 이름을 알려주세요"
        case sizeTitle = "어떤 사이즈를 구매하셨나요?"
        case subCategoryTitle = "옷 종류를 알려주세요"
        case measurementImageTitle = "수치 사진을 올려주세요"
        case clothImageTitle = "옷 사진을 올려주세요"
    }
    enum Progress: String, CaseIterable {
        case name = "옷 이름"
        case size = "사이즈"
        case clothType = "옷 종류"
        case registPic = "사진 등록"
    }
}

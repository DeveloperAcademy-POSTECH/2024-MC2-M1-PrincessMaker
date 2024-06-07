//
//  MainCategory.swift
//  STOD
//
//  Created by 김이예은 on 5/19/24.
//
import SwiftUI

enum MainCategory: String, CaseIterable {
    
    //하.. 이걸 어떻게 로컬라이징 하지 흠 CaseIterable 빼면 안될거같은 느낌
    case onepiece = "원피스"
    case shoes = "신발"
    case accessory = "패션잡화"
    case recent = "최근"
    case outer = "아우터"
    case top = "상의"
    case bottom = "하의"
    
    var circleImage: Image {
        switch self {
        case .recent: return Image(.categoryCircleRecent)
        case .outer: return Image(.categoryCircleOuter)
        case .top: return Image(.categoryCircleTop)
        case .bottom: return Image(.categoryCircleBottom)
        case .onepiece: return Image(.categoryCircleOnepiece)
        case .shoes: return Image(.categoryCircleShoes)
        case .accessory: return Image(.categoryCircleAccessory)
        }
    }
    
    var image: Image {
        switch self {
        case .recent: return Image(.categoryEmptyRecent)
        case .outer: return Image(.categoryEmptyOuter)
        case .top: return Image(.categoryEmptyTop)
        case .bottom: return Image(.categoryEmptyBottom)
        case .onepiece: return Image(.categoryEmptyOnepiece)
        case .shoes: return Image(.categoryEmptyShoes)
        case .accessory: return Image(.categoryEmptyAccessory)
        }
    }
    
    var subcategories: [String] {
        switch self {
        case .recent:
            return []
        case .top:
            return [
                "맨투맨_스웨트셔츠",
                "셔츠_블라우스",
                "후드_티셔츠",
                "니트_스웨터",
                "피케_카라_티셔츠",
                "긴소매_티셔츠",
                "반소매_티셔츠",
                "민소매_티셔츠",
                "스포츠_상의",
                "기타_상의"
            ]
        case .outer:
            return [
                "후드_집업",
                "블루종",
                "레더_라이더스_재킷",
                "무스탕_퍼",
                "청재킷",
                "슈트_블레이저_재킷",
                "카디건",
                "아노락_재킷",
                "플리스_뽀글이",
                "트레이닝_재킷",
                "스타디움_재킷",
                "환절기_코트",
                "겨울_싱글_코트",
                "겨울_더블_코트",
                "겨울_기타_코트",
                "롱패딩_롱헤비_아우터",
                "숏패딩_숏헤비_아우터",
                "패딩_베스트",
                "베스트",
                "사파리_헌팅_재킷",
                "나일론_코치_재킷",
                "기타_아우터"
            ]
        case .bottom:
            return [
                "데님_팬츠",
                "코튼_팬츠",
                "슈트_팬트_슬랙스",
                "트레이닝_조거_팬츠",
                "숏팬츠",
                "레깅스",
                "점프_슈트_오버올",
                "스포츠_하의",
                "기타_바지",
                "미니_스커트",
                "미디_스커트",
                "롱_스커트",
                "기타_스커트"
            ]
        case .onepiece:
            return [
                "미니_원피스",
                "미디_원피스",
                "맥시_원피스",
                "기타_원피스"
            ]
        case .shoes:
            return [
                "패션_스니커즈화",
                "캔버스_단화",
                "스포츠_스니커즈",
                "구두",
                "로퍼",
                "힐_펌프스",
                "플랫_슈즈",
                "블로퍼",
                "샌들",
                "슬리퍼",
                "부츠",
                "모카신_보트_슈즈",
                "기타_신발"
            ]
        case .accessory:
            return [
                "가방",
                "모자",
                "양말_레그워머",
                "선글라스_안경테",
                "액세서리",
                "시계",
                "주얼리",
                "언더웨어"
            ]
        }
    }
    var localizedSubcategories: [LocalizedStringKey] {
        return subcategories.map {LocalizedStringKey($0)}
    }
}

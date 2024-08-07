//
//  MainCategory.swift
//  STOD
//
//  Created by 김이예은 on 5/19/24.
//
import SwiftUI

enum MainCategory: String, CaseIterable {
    
    case recent = "최근"
    case outer = "아우터"
    case top = "상의"
    case bottom = "하의"
    case onepiece = "원피스"
    case shoes = "신발"
    case accessory = "패션잡화"
    
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
            return ["맨투맨/스웨트셔츠",
                    "셔츠/블라우스",
                    "후드 티셔츠",
                    "니트/스웨터",
                    "피케/카라 티셔츠",
                    "긴소매 티셔츠",
                    "반소매 티셔츠",
                    "민소매 티셔츠",
                    "스포츠 상의",
                    "기타 상의"]
        case .outer:
            return ["후드 집업",
                    "블루종",
                    "레더/라이더스 재킷",
                    "무스탕/퍼",
                    "청재킷",
                    "슈트/블레이저 재킷",
                    "카디건",
                    "아노락 재킷",
                    "플리스/뽀글이",
                    "트레이닝 재킷",
                    "스타디움 재킷",
                    "환절기 코트",
                    "겨울 싱글 코트",
                    "겨울 더블 코트",
                    "겨울 기타 코트",
                    "롱패딩/롱헤비 아우터",
                    "숏패딩/숏헤비 아우터",
                    "패딩 베스트",
                    "베스트",
                    "사파리/헌팅 재킷",
                    "나일론/코치 재킷",
                    "기타 아우터"]
        case .bottom:
            return ["데님 팬츠",
                    "코튼 팬츠",
                    "슈트 팬트/슬랙스",
                    "트레이닝/조거 팬츠",
                    "숏팬츠",
                    "레깅스",
                    "점프 슈트/오버올",
                    "스포츠 하의",
                    "기타 바지",
                    "미니 스커트",
                    "미디 스커트",
                    "롱 스커트",
                    "기타 스커트"]
        case .onepiece:
            return ["미니 원피스",
                    "미디 원피스",
                    "맥시 원피스",
                    "기타 원피스"]
        case .shoes:
            return ["패션 스니커즈화",
                    "캔버스/단화",
                    "스포츠 스니커즈",
                    "구두",
                    "로퍼",
                    "힐/펌프스",
                    "플랫 슈즈",
                    "블로퍼",
                    "샌들",
                    "슬리퍼",
                    "부츠",
                    "모카신/보트 슈즈",
                    "기타 신발"]
        case .accessory:
            return ["가방",
                    "모자",
                    "양말/레그워머",
                    "선글라스/안경테",
                    "액세서리",
                    "시계",
                    "주얼리",
                    "언더웨어"]
        }
    }
}

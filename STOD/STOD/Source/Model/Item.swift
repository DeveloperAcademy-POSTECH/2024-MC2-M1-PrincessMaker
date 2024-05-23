//
//  Item.swift
//  STOD
//
//  Created by 이윤학 on 5/18/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

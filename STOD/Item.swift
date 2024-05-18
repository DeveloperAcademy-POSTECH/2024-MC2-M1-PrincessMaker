//
//  Item.swift
//  STOD
//
//  Created by 김이예은 on 5/19/24.
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

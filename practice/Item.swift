//
//  Item.swift
//  practice
//
//  Created by 초긍정행운의포춘쿠키 on 3/11/26.
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

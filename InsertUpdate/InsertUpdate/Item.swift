//
//  Item.swift
//  InsertUpdate
//
//  Created by Seamus O'Mahoney on 12/26/24.
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

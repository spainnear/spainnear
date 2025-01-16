//
//  Untitled.swift
//  InsertUpdate
//
//  Created by Seamus O'Mahoney on 12/26/24.
//

import Foundation
import SwiftData

@Model
class Movie {
    var name: String
    var director: Director?
    
    init(name: String, director: Director) {
           self.name = name
           self.director = director
       }
}


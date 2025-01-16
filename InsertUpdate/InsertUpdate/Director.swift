//
//  Director.swift
//  InsertUpdate
//
//  Created by Seamus O'Mahoney on 12/26/24.
//

import Foundation
import SwiftData

@Model
class Director {
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \Movie.director) var movies: [Movie]

       init(name: String = "", movies: [Movie] = [Movie]()) {
           self.name = name
           self.movies = movies
       }
}


//
//  Destination.swift
//  SwiftData-iTour
//
//  Created by Heecheon Park on 10/2/23.
//

import Foundation
import SwiftData

// @Model macro makes data to automatically conforms to Identifiable.
@Model class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}

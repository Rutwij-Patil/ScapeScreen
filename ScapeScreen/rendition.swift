//
//  rendition.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 26/12/23.
//

import Foundation
import PencilKit
import SwiftData

@Model
class Rendition: Identifiable {
    var id: String
    var title: String
    var drawing: Data
    var created: Date

    init(title: String, drawing: Data) {
        self.id = UUID().uuidString
        self.title = title
        self.drawing = drawing
        self.created = Date()
    }
    
}

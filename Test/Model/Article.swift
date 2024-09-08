//
//  Article.swift
//  Test
//
//  Created by Aryan Sharma on 02/09/24.
//

import Foundation
import SwiftUI


struct Article: Codable, Identifiable {
    var id: Int = 0
    var type: String = "Technology"
    var category: String = "News"
    var date: String = "26 Feb 2023"
    var heading: String = "Heading"
    var subHeading: String = "Sub Heading"
    var image: String = "SamplePhoto9"
    var similarTopics: [String] = []
    var parts: [String: String]  = [:]

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case type = "Type"
        case category = "Category"
        case date = "Date"
        case heading = "Heading"
        case subHeading = "Sub-Heading"
        case image = "Image"
        case similarTopics = "Similar Topics"
        case parts = "Parts"
    }
    
}

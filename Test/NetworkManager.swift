//
//  NetworkManager.swift
//  Test
//
//  Created by Aryan Sharma on 06/09/24.
//

import Foundation

class NetworkManager {
    
    enum ErrorDescriptionFor: String {
        case jsonfileNotFound = "Could not find the \"Sample.json\" file in the bundle."
        case  decodingError = "Failed to load or decode \"Sample.json\" file."
    }
        
    static let shared = NetworkManager()
    
    
    private init() {}
    

    // Making the function async to simulate API call.
    func getArticles() async -> ([Article]?, String?) {
        // Locate the JSON file in the bundle
        guard let url = Bundle.main.url(forResource: "Sample", withExtension: "json") else {
            return (nil, ErrorDescriptionFor.jsonfileNotFound.rawValue)
        }
        
        do {
            // Perform file reading
            let data = try Data(contentsOf: url)
            
            // Decode the JSON data into the Articles struct
            let decoder = JSONDecoder()
            let articles = try decoder.decode([Article].self, from: data)
            
            return (articles, nil)
        } catch {
            return (nil, ErrorDescriptionFor.decodingError.rawValue)
        }
    }
}

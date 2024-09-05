//
//  ArticleFeedScreenViewModel.swift
//  Test
//
//  Created by Aryan Sharma on 31/08/24.
//

import Foundation
import SwiftUI

extension ArticleFeedScreen {
    @Observable
    class ViewModel {
        var articles = [Article]()
         
        init() {
            self.articles = loadJSON() ?? []
        }
        
        func loadJSON() -> [Article]? {
            // Locate the JSON file in the bundle
            if let url = Bundle.main.url(forResource: "Sample", withExtension: "json") {
                do {
                    // Load the data from the file
                    let data = try Data(contentsOf: url)
                    
                    // Decode the JSON data into the Articles struct
                    let decoder = JSONDecoder()
                    let articles = try decoder.decode([Article].self, from: data)
                    return articles
                } catch {
                    print("Failed to load or decode JSON: \(error)")
                }
            } else {
                print("Could not find the file in the bundle.")
            }
            
            return nil
        }
    }
}

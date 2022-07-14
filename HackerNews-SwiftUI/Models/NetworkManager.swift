//
//  NetworkManager.swift
//  HackerNews-SwiftUI
//
//  Created by Ken Maready on 7/13/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    var baseUrl = "http://hn.algolia.com/api/v1/search?"
    var defaultSearchTerms = "tags=front_page"
    
    func fetchData(searchTerms: String = "tags=front_page") {
        if let url = URL(string: baseUrl + searchTerms) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            print("safeData: \(safeData.count)")
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

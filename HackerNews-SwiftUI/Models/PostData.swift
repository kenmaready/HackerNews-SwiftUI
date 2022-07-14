//
//  PostData.swift
//  HackerNews-SwiftUI
//
//  Created by Ken Maready on 7/13/22.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    let points: Int
    let title: String
    let url: String?

    // computed property "id" to conform to Identifiable protocol
    var id: String {
        return objectID
    }
}

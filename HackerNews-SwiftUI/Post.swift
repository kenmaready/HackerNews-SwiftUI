//
//  Post.swift
//  HackerNews-SwiftUI
//
//  Created by Ken Maready on 7/12/22.
//

import Foundation

struct Post: Identifiable {
    let id: String
    let title: String
}

let testPosts = [
    Post(id: "ssdi32", title: "12 things you can do NOW to stop overeating"),
    Post(id: "eie93e", title: "Star of Stranger Things Almost Turned Role Down"),
    Post(id: "jf94f0", title: "The Real Reason Ariana Grande Went Out with Pete Davidson")
]

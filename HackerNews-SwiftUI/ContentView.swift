//
//  ContentView.swift
//  HackerNews-SwiftUI
//
//  Created by Ken Maready on 7/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(testPosts) { post in
                HStack {
                    Text(post.id)
                    Text(post.title)
                    Image(systemName: "newspaper.fill")
                }
            }
            .navigationTitle("hacker world:")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  HackerNews-SwiftUI
//
//  Created by Ken Maready on 7/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                HStack {
                    NavigationLink( destination: PostDetailView(url: post.url)
                    ) {
                        Text(String(post.points)).font(.system(size: 10))
                        Text(post.title).font(.system(size: 12))
                    }
                }
            }
            .navigationTitle("H4CK3R W0RLD:")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

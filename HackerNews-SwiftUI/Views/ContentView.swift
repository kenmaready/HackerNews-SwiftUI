//
//  ContentView.swift
//  HackerNews-SwiftUI
//
//  Created by Ken Maready on 7/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @State private var keyword: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Search:")
                    TextField("Keyword", text: $keyword)
                        .border(.secondary).textInputAutocapitalization(.never)
                        .onSubmit {
                            print("searching for: \(keyword)")
                            networkManager.fetchData(searchTerms: "query=\(keyword)&tags=story")
                            keyword = ""
                        }
                }.padding(.horizontal)
                List(networkManager.posts) { post in
                    HStack {
                        NavigationLink( destination: PostDetailView(url: post.url)
                        ) {
                            Text(String(post.points)).font(.system(size: 10))
                            Text(post.title).font(.system(size: 12))
                        }
                    }
                }.refreshable {
                    // TODO: fix so that refresh will maintain
                    // current keyword search if applicable
                    // (currently refresh will default to
                    // basic article search and forget
                    // current keyword)
                    networkManager.fetchData()
                }
                .navigationTitle("H4CK3R W0RLD:")
            }
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

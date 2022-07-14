//
//  PostDetailView.swift
//  HackerNews-SwiftUI
//
//  Created by Ken Maready on 7/13/22.
//

import SwiftUI

struct PostDetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(url: "https://www.google.com")
    }
}


//
//  ImageView.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    let url: String
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        GeometryReader { geo in
            WebImage(url: URL(string: self.url))
                .resizable()
                .indicator(.activity)
                .clipped()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "wkkwkwkw")
    }
}

//
//  ProfileView.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ImageView(url: "https://scontent.fcgk6-1.fna.fbcdn.net/v/t1.0-9/71929977_3067937963278249_1151208182022930432_n.jpg?_nc_cat=110&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGinH1nsgSe0IWFGDWl2WSLWWu4k6Evc7dZa7iToS9ztxgTe-p4TkC4hYEIS7yIv2w3TF4bPvX8VGUHY2JQdOHf&_nc_ohc=2Mc3_4nIs3kAX9EsZ2B&_nc_ht=scontent.fcgk6-1.fna&oh=c5d6b7510df8f4fc08b1f395e6a98a66&oe=5FF5586E")
                .frame(width: 250, height: 250)
                .scaledToFit()
                .cornerRadius(20)
            
            Text("I Putu Wahyu Permadi")
                .font(.title)
            Text("https://github.com/wahyupermadie")
                .foregroundColor(.gray)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//
//  ContentView.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import SwiftUI
import Resolver

struct ContentView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                        self.viewModel.getCategories()
                
                }
            )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: Resolver.resolve())
    }
}

//
//  ContentView.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import SwiftUI
import Resolver

struct ContentView: View {
    let repository: GameRepository
    init(repository: GameRepository) {
        self.repository = repository
    }
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {repository.getGames(search: nil)})
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(repository: Resolver.resolve())
    }
}

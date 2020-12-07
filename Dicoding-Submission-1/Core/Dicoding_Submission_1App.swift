//
//  Dicoding_Submission_1App.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 07/12/20.
//

import SwiftUI
import Resolver

@main
struct Dicoding_Submission_1App: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: Resolver.resolve())
        }
    }
}


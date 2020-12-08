//
//  Navigation.swift
//  Dicoding-Submission-1
//
//  Created by Wahyu Permadi on 08/12/20.
//

import Foundation
import SwiftUI
import Resolver

func navigateToDetailPage<Content: View>(
    for gameId: Int,
    @ViewBuilder content: () -> Content
) -> some View {
    NavigationLink(
        destination: DetailGame(gameId: gameId, viewModel: Resolver.resolve()),
        label: {
            content()
        }
    )
}

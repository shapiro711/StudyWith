//
//  ContentFlowState.swift
//  MainFeed
//
//  Created by Kim Do hyung on 1/1/24.
//  Copyright © 2024 shapiro. All rights reserved.
//

import Foundation
import SwiftUI

public enum ContentLink: Hashable, Identifiable {
    case sheetLink(item: String)
    case coverLink(item: String)

    public var id: String {
        String(describing: self)
    }
}

public class ContentFlowState: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedItem: ContentLink?
    @Published var coverItem: ContentLink?
    
    public init() { }
}

public struct ContentFlowCoordinator<Content: View>: View {

    @ObservedObject var state: ContentFlowState
    let content: () -> Content
    
    public init(state: ContentFlowState,
                @ViewBuilder content: @escaping () -> Content) {
        self.state = state
        self.content = content
    }

    public var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
                    .sheet(item: $state.presentedItem, content: sheetContent)
                    .fullScreenCover(item: $state.coverItem, content: coverContent)
            }
            .navigationDestination(for: ContentLink.self, destination: linkDestination)
            .navigationDestination(for: String.self, destination: customDestination)
        }
    }

    @ViewBuilder private func linkDestination(link: ContentLink) -> some View {
        switch link {
        default:
            EmptyView()
        }
    }

    @ViewBuilder private func sheetContent(item: ContentLink) -> some View {
        switch item {
        case let .sheetLink(text):
            EmptyView()
        default:
            EmptyView()
        }
    }

    @ViewBuilder private func coverContent(item: ContentLink) -> some View {
        switch item {
        case let .coverLink(text):
            EmptyView()
        default:
            EmptyView()
        }
    }

    private func customDestination(text: String) -> some View {
        Text(text)
    }
}

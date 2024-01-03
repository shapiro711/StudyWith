//
//  ContentFlowState.swift
//  MainFeed
//
//  Created by Kim Do hyung on 1/1/24.
//  Copyright © 2024 shapiro. All rights reserved.
//

import Foundation
import SwiftUI

public enum MainFeedLink: Hashable, Identifiable {
    case sheetLink(item: String)
    case coverLink(item: String)

    public var id: String {
        String(describing: self)
    }
}

public class MainFeedFlowState: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedItem: MainFeedLink?
    @Published var coverItem: MainFeedLink?
    
    public init() { }
}

public struct MainFeedFlowCoordinator<Content: View>: View {

    @ObservedObject var state: MainFeedFlowState
    let content: () -> Content
    
    public init(state: MainFeedFlowState,
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
            .navigationDestination(for: MainFeedLink.self, destination: linkDestination)
            .navigationDestination(for: String.self, destination: customDestination)
        }
    }

    @ViewBuilder private func linkDestination(link: MainFeedLink) -> some View {
        switch link {
        default:
            EmptyView()
        }
    }

    @ViewBuilder private func sheetContent(item: MainFeedLink) -> some View {
        switch item {
        case let .sheetLink(text):
            EmptyView()
        default:
            EmptyView()
        }
    }

    @ViewBuilder private func coverContent(item: MainFeedLink) -> some View {
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

//
//  MainFeedView.swift
//  MainFeed
//
//  Created by Kim Do hyung on 12/28/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import SwiftUI
import MainFeedInterface

struct MainFeedView: View {
    let flowState = MainFeedFlowState()
    
    var body: some View {
        MainFeedFlowCoordinator(state: flowState, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            Text("MainFeed")
        }
        .navigationBarTitle("MainFeed", displayMode: .inline)
    }
}

#Preview {
    MainFeedView()
}

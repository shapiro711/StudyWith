//
//  MainTabFeature.swift
//  MainTab
//
//  Created by Kim Do hyung on 12/31/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import Foundation
import MainTabInterface
import ComposableArchitecture

@Reducer
struct MainTabFeature {
    let flowState: MainTabFlowState
    
    struct State: Equatable, Identifiable {
        @BindingState var description = ""
        let id: UUID
    }
    
    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
    }
    
    init(flowState: MainTabFlowState) {
        self.flowState = flowState
    }
}

extension MainTabFeature {
    static func createStore() -> StoreOf<MainTabFeature> {
        let initialState = State(id: UUID())
        let flowState = MainTabFlowState()
        
        return Store(initialState: initialState) {
            MainTabFeature(flowState: flowState)
        }
    }
}

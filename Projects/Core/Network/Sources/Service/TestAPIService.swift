//
//  TestAPIService.swift
//  Network
//
//  Created by Kim Do hyung on 12/26/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import Foundation

public struct TestAPIService: BaseNetworkService {
    typealias Target = FeedAPITarget
    
    private let provider = makeProvider()
    
    public init() {}

//    public func getFeed() async throws -> {
//        let response = try await provider.requestAwait(.getFeed)
//        
//    }
}

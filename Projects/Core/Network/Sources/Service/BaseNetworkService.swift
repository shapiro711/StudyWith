//
//  BaseNetworkService.swift
//  Network
//
//  Created by Kim Do hyung on 12/26/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import Foundation
import Moya

protocol BaseNetworkService {
    associatedtype Target: TargetType
    
    static func makeProvider() -> MoyaProvider<Target>
}


extension BaseNetworkService {
    /// 플러그인 설정
    static func makeProvider() -> MoyaProvider<Target> {
        let loggerPlugin = NetworkLoggerPlugin()
        return MoyaProvider<Target>(plugins: [loggerPlugin])
    }
}


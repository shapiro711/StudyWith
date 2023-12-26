//
//  BaseTargetType.swift
//  Network
//
//  Created by Kim Do hyung on 12/26/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var sampleData: Data {
        return Data()
    }
}

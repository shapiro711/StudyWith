//
//  FeedAPITarget.swift
//  Network
//
//  Created by Kim Do hyung on 12/26/23.
//  Copyright © 2023 shapiro. All rights reserved.
//

import Foundation
import Moya

enum FeedAPITarget {
    /// 아이템 등록
    case getFeed
}

extension FeedAPITarget: BaseTargetType {
    var path: String {
        switch self {
        case .getFeed:
            return "/feed"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getFeed:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getFeed(let request):
            return .requestPlain
        }
    }

    var validationType: ValidationType {
        return .successCodes
    }
}


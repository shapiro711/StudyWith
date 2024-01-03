//
//  MainFeedAssembly.swift
//  MainFeed
//
//  Created by Kim Do hyung on 1/2/24.
//  Copyright © 2024 shapiro. All rights reserved.
//

import Foundation
import MainFeedInterface
import Swinject

public final class MainFeedAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(MainFeedCreateable.self) { _ in
            MainFeedFactory()
        }
    }
}

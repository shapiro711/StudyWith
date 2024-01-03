//
//  MainTabAssembly.swift
//  MainTab
//
//  Created by Kim Do hyung on 1/2/24.
//  Copyright © 2024 shapiro. All rights reserved.
//

import Foundation
import Swinject
import MainFeedInterface
import MainTabInterface

public final class MainTabAssembly: Assembly {
    public init() { }
    public func assemble(container: Container) {
        container.register(MainTabCreateable.self) { reslover in
            MainTabFactory(
                mainFeedFactory: reslover.resolve(MainFeedCreateable.self)!
            )
        }
    }
}

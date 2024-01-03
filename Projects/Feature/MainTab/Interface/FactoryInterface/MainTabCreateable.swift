//
//  MainTabCreateable.swift
//  MainTab
//
//  Created by Kim Do hyung on 1/1/24.
//  Copyright © 2024 shapiro. All rights reserved.
//

import Foundation
import SwiftUI

public protocol MainTabCreateable {
    func makeMainTabCoordinator() -> MainTabFlowCoordinator<AnyView>
}

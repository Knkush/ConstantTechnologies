//
//  Startup.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

public extension Container {
    func registerCore() -> Container {
        // MARK: - Services -
        self.autoregister(ICTApiService.self, initializer: CTApiService.init)
        
        return self
    }
}

//
//  Startup.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import ConstantTechnologiesCore

extension Container {
    
    @discardableResult
    func register() -> Container {
        // MARK: - Services -
        self.autoregister(IDialogService.self, initializer: DialogService.init)
        self.autoregister(IPhotoCatchService.self, initializer: PhotoCatchService.init)

        return self
    }
}

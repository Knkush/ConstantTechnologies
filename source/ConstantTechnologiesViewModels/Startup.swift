//
//  Startup.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Swinject
import SwinjectAutoregistration
import ConstantTechnologiesCore

public extension Container {
    func registerViewModels() -> Container {
        // MARK: - ViewModels -
        
        self.autoregister(IRegisterViewModel.self, initializer: RegisterViewModel.init)
        
        return self
    }
}

//
//  main.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit
import ConstantTechnologiesCore
import ConstantTechnologiesViewModels

autoreleasepool {
    _ = ServiceLocator.instance
        .register()
        .registerCore()
        .registerViewModels()
    
    UIApplicationMain(CommandLine.argc,
                      CommandLine.unsafeArgv,
                      NSStringFromClass(UIApplication.self),
                      NSStringFromClass(AppDelegate.self))
}


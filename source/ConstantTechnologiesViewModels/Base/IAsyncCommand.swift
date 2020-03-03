//
//  IAsyncCommand.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Bond
import Promises

public protocol IAsyncCommand : ICommand {
    var isBusy: Observable<Bool> { get }
    var isSuccessful: Observable<Bool> { get }
    var failureMessage: Observable<String?> { get }
}

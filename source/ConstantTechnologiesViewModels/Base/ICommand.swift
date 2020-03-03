//
//  ICommand.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Bond

public protocol ICommand {
    var isEnabled: Observable<Bool> { get }
    func setEnabled(value: Bool)
    func execute()
}


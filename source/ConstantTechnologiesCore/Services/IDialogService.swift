//
//  IDialogService.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Promises

public protocol IDialogService {
    func displayConfirmation(_ title: String, _ message: String, _ confirmButton: String, _ cancelButton: String) -> Promise<Bool>
}

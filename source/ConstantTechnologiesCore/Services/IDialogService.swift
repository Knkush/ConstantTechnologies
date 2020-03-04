//
//  IDialogService.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Promises

public protocol IDialogService {
    func displayAlert(title: String?, message: String?, cancelButton: String?)
    func displayActionSheet(title: String, message: String?, cancelButton: String?, alternativeButtons: String?...) -> Promise<Int?>
}

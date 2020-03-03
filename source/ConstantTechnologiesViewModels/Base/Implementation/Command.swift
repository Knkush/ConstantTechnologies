//
//  Command.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Bond

internal class Command: NSObject, ICommand {
    var isEnabled: Observable<Bool>
    
    init(isEnabled: Bool = true) {
        self.isEnabled = Observable<Bool>(isEnabled)
    }
    
    func setEnabled(value: Bool) {
        self.isEnabled.value = value
    }
    
    func execute() {
        
    }
}


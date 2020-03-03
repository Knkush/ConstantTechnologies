//
//  CommandableButton.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit
import ConstantTechnologiesViewModels

class CommandableButton: UIButton {
    var command: ICommand? {
        didSet {
            self.addTarget(self, action: #selector(self.execute), for: .touchUpInside)
            self.command?.isEnabled.bind(to: self.reactive.isEnabled).dispose(in: self.bag)
        }
    }
    
    @objc private func execute() {
        self.command?.execute()
    }
}

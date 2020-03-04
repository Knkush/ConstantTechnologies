//
//  CommandableButton+Enabled.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit

extension CommandableButton {
    override open var isEnabled: Bool {
        didSet {
            self.backgroundColor = (self.isEnabled ? self.enabledColor : .lightGray)
        }
    }
}

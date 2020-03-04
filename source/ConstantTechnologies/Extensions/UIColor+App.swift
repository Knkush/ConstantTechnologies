//
//  UIColor+App.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/5/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit

extension UIColor {
    enum App: String {
        case orange
        case lightOrange

        var color: UIColor? {
            return UIColor(named: self.rawValue)
        }
    }
}

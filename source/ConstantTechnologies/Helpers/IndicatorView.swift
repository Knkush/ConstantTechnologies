//
//  IndicatorView.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/5/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit

class IndicatorView: UIView {
    @IBOutlet private var indicators: [UIView]!
    @IBOutlet private weak var leftIndicatorWidth: NSLayoutConstraint!
    @IBOutlet private weak var righthIndIndicatorWidth: NSLayoutConstraint!
    var isOn: Bool = true { didSet { self.updateState() } }
    
    
    private func updateState() {
        UIView.animate(withDuration: 1.0) {
            self.leftIndicatorWidth.constant = (self.isOn ? 10 : 22)
            self.righthIndIndicatorWidth.constant = (self.isOn ? 22 : 10)
            self.indicators[0].backgroundColor = (self.isOn ? UIColor.App.lightOrange.color : UIColor.App.orange.color)
            self.indicators[1].backgroundColor = (self.isOn ? UIColor.App.orange.color : UIColor.App.lightOrange.color)
        }
    }
}

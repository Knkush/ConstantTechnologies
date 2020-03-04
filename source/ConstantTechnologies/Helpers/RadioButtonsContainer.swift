//
//  RadioButtonsContainer.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit
import Bond

final class RadioButtonsContainer: UIView {
    @IBOutlet private weak var passportRadioButton: RadioButton!
    @IBOutlet private weak var idNumberRadioButton: RadioButton!
    let isPassportActive: Observable<Bool> = Observable<Bool>(true)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    private func setup() {
        self.isPassportActive.bidirectionalBind(to: self.passportRadioButton.isOn).dispose(in: self.bag)

        self.passportRadioButton.isOn.map{ !$0 }.bind(to: self.idNumberRadioButton.isOn).dispose(in: self.bag)
        self.idNumberRadioButton.isOn.map{ !$0 }.bind(to: self.passportRadioButton.isOn).dispose(in: self.bag)
    }
}

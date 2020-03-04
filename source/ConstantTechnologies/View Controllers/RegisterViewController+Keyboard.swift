//
//  RegisterViewController+Keyboard.swift
//  ConstantTechnologies
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit
import Bond

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.fullNameTextField:
            self.phoneNumberTextField.becomeFirstResponder()
        case self.phoneNumberTextField:
            self.emailTextField.becomeFirstResponder()
        case self.emailTextField:
            self.view.endEditing(true)
        case self.cjNumberTextField:
            self.passportOrIdTextField.becomeFirstResponder()
        case self.passportOrIdTextField:
            self.view.endEditing(true)
        default:
            break
        }
        
        return true
    }
    
    func bindGestureRecognizers() {
        self.view.reactive.tapGesture().observeNext { [unowned self] _ in
            self.view.endEditing(true)
        }.dispose(in: self.bag)
    }
}

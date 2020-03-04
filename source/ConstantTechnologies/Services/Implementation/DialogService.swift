//
//  DialogService.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import ConstantTechnologiesCore
import UIKit
import Promises

class DialogService: IDialogService {
    
      func displayAlert(title: String?, message: String?, cancelButton: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let cancelButton = cancelButton {
            alertController.addAction(UIAlertAction(title: cancelButton, style: .default, handler: nil))
        }
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    func displayActionSheet(title: String,
                            message: String? = nil,
                            cancelButton: String? = nil,
                            alternativeButtons: String?...) -> Promise<Int?> {
        let promise = Promise<Int?> { fulfill, reject in
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            if let cancelButton = cancelButton {
                alertController.addAction(UIAlertAction(title: cancelButton, style: .default, handler: { (_) in
                    fulfill(nil)
                }))
            }
            
            for index in 0..<alternativeButtons.count {
                alertController.addAction(UIAlertAction(title: alternativeButtons[index], style: .default, handler: { (_) in
                    fulfill(index)
                }))
            }
            
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
        
        return promise
    }
}

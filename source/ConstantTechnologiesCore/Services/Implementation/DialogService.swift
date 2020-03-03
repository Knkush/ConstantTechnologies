//
//  DialogService.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import UIKit
import Promises

public class DialogService: IDialogService {
    
    public init() {
        
    }
    
    public func displayConfirmation(_ title: String,
                                    _ message: String,
                                    _ confirmButton: String,
                                    _ cancelButton: String) -> Promise<Bool> {
        
        let promise = Promise<Bool>.init { (success, error) in
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            let cancelButtonAction = UIAlertAction(title: cancelButton, style: .default) { (action) in
                success(false)
            }
            
            let confirmButtonAction = UIAlertAction(title: confirmButton, style: .default) { (action) in
                success(true)
            }
            
            alert.addAction(cancelButtonAction)
            alert.addAction(confirmButtonAction)
            
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        
        return promise
    }
}

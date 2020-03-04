//
//  SubmitCommand.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import ConstantTechnologiesCore
import ReactiveKit

internal class SubmitCommand: Command {
    private weak var viewModel: RegisterViewModel!
    private let dialogService: IDialogService
    
    
    init(_ viewModel: RegisterViewModel,
         _ dialogService: IDialogService) {
        self.viewModel = viewModel
        self.dialogService = dialogService
        
        super.init()
        
        let canSubmit = combineLatest(self.viewModel.isPassportInfoAllowable,
                                      self.viewModel.cjNumber) { isPassportInfoAllowable, cjNumber in
                                        return isPassportInfoAllowable &&
                                            !cjNumber.isNilOrEmpty()
        }
        
        canSubmit.bind(to: self.isEnabled).dispose(in: self.bag)
    }
    
    override func execute() {
        guard
            let fullName = self.viewModel.fullName.value,
            let phoneNumber = self.viewModel.phoneNumber.value,
            let cjNumber = self.viewModel.cjNumber.value,
            !fullName.isEmpty,
            !phoneNumber.isEmpty,
            !cjNumber.isEmpty else {
                self.dialogService.displayAlert(title: "Error.",
                                                message: "Fullname, PhoneNumber and CJ Number fields are required.",
                                                cancelButton: "Ok")
                return
        }
        
        let newUser = UserItemViewModel(self.viewModel.image.value,
                                        fullName,
                                        phoneNumber,
                                        self.viewModel.email.value,
                                        cjNumber,
                                        self.viewModel.isPassport.value,
                                        self.viewModel.passportOrIdNumber.value)
        
        self.dialogService.displayAlert(title: "Success. User has signed up.",
                                        message: newUser.description,
                                        cancelButton: "Ok")
    }
}

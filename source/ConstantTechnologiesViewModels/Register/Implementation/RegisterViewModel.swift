//
//  RegisterViewModel.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Bond
import ConstantTechnologiesCore

internal class RegisterViewModel: IRegisterViewModel {
    private let dialogService: IDialogService
    lazy var setupCommand: ICommand = SetupRegisterCommand(self)
    lazy var submitCommand: ICommand = SubmitCommand(self, self.dialogService)
    var image = Observable<Data?>(nil)
    let fullName = Observable<String?>(nil)
    let phoneNumber = Observable<String?>(nil)
    let email = Observable<String?>(nil)
    let cjNumber = Observable<String?>(nil)
    let passportOrIdNumber = Observable<String?>(nil)
    let isPassportInfoAllowable = Observable<Bool>(false)
    let isPassport = Observable<Bool>(true)
 
    
    init(_ dialogService: IDialogService) {
        self.dialogService = dialogService
    }
}

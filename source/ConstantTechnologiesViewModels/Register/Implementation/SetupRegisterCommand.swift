//
//  SetupRegisterCommand.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import ReactiveKit

internal class SetupRegisterCommand: Command {
    private weak var viewModel: RegisterViewModel!
    
    
    init(_ viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
    
    override func execute() {
        let isPassportInfoAllowable = combineLatest(self.viewModel.fullName,
                                                    self.viewModel.phoneNumber) { fullName, phoneNumber in
                                                        return !fullName.isNilOrEmpty() &&
                                                            !phoneNumber.isNilOrEmpty() &&
                                                            fullName!.count >= 4 &&
                                                            phoneNumber!.count >= 6
        }
        
        isPassportInfoAllowable.bind(to: self.viewModel.isPassportInfoAllowable).dispose(in: self.bag)
    }
}

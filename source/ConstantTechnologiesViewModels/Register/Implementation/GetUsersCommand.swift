//
//  GetUsersCommand.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import ConstantTechnologiesCore
import Promises

internal class GetUsersCommand: AsyncCommand {
    private weak var viewModel: RegisterViewModel!
    private let apiService: ICTApiService
    private let dialogService: IDialogService
    
    
    init(_ viewModel: RegisterViewModel,
         _ apiService: ICTApiService,
         _ dialogService: IDialogService) {
        self.viewModel = viewModel
        self.apiService = apiService
        self.dialogService = dialogService
    }
    
    override func executeCoreAsync() -> Promise<Bool> {
        return self.apiService.getUsers()
            .then({ [weak self] (users)  in
                let usersCount = "Users count is \(users.count)."
                let allNames = users.map({ "\($0.username) - \($0.email)" }).joined(separator: "\n")
                let message = """
                \(usersCount)
                \(allNames)
                """
                
                self?.dialogService.displayAlert(title: "Success.Users From Server.",
                                                 message: message,
                                                 cancelButton: "Ok")
                
                return Promise(true)
            })
    }
    
    override func handleError(_ error: Error) {
        super.handleError(error)
        
        self.dialogService.displayAlert(title: "Error.",
                                        message: "Something went wront to get users from server.",
                                        cancelButton: "Ok")
    }
}

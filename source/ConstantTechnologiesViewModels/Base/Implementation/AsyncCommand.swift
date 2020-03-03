//
//  AsyncCommand.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Promises
import Bond

internal class AsyncCommand: Command, IAsyncCommand {
    public var isBusy = Observable<Bool>(false)
    public var isSuccessful = Observable<Bool>(false)
    public var failureMessage = Observable<String?>(nil)
    
    
    public override func execute() {
        self.executeAsync()
    }
    
    @discardableResult
    public func executeAsync() -> Promise<Bool> {
        if !self.isEnabled.value {
            return Promise(false)
        }
        
        self.isBusy.value = true
        self.isSuccessful.value = false
        self.failureMessage.value = nil
        
        return executeCoreAsync().then { [unowned self] isSuccessful in
            self.isSuccessful.value = isSuccessful
            }
            .always {
                self.isBusy.value = false
            }
            .catch { error in
                self.handleError(error)
        }
    }
    
    @discardableResult
    internal func executeCoreAsync() -> Promise<Bool> {
        preconditionFailure("This method must be overridden")
    }
    
    internal func handleError(_ error: Error) {
        print(error)
        failureMessage.value = "Something went wrong while executing operation. Please try again."
    }
}


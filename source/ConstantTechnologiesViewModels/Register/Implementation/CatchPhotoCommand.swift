//
//  CatchPhotoCommand.swift
//  ConstantTechnologiesViewModels
//
//  Created by Khachatur Hakobyan on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import ConstantTechnologiesCore
import ReactiveKit

internal class CatchPhotoCommand: Command {
    private weak var viewModel: RegisterViewModel!
    private let dialogService: IDialogService
    private let photoCatchService: IPhotoCatchService

    
    init(_ viewModel: RegisterViewModel,
         _ dialogService: IDialogService,
         _ photoCatchService: IPhotoCatchService) {
        self.viewModel = viewModel
        self.dialogService = dialogService
        self.photoCatchService = photoCatchService
    }
    
    override func execute() {
        self.dialogService.displayActionSheet(title: "Change Photo",
                                              message: nil,
                                              cancelButton: "Cancel",
                                              alternativeButtons: "Take Photo", "Choose from Library")
            .then { [weak self] (index) in
                guard let targetIndex = index else { return }
                
                let fromCamera = (targetIndex == 0)
                
                guard self?.photoCatchService.isSourceTypeAvailable(isSourceTypeCamera: fromCamera) ?? true else {
                    self?.dialogService.displayAlert(title: "Error.", message: "This source type is not available.", cancelButton: "Ok")
                    return
                }
                
                self?.photoCatchService.catchPhoto(fromCamera: fromCamera)
                    .then { [weak self] (imageData)  in
                        
                        guard let imageData = imageData else {
                            self?.dialogService.displayAlert(title: "Error.", message: "Something went wrong.", cancelButton: "Ok")
                            return
                        }
                        
                        self?.viewModel.image.value = imageData
                }
        }
    }
}

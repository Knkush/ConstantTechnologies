//
//  IRegisterViewModel.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/3/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Bond

public protocol IRegisterViewModel {
    var setupCommand: ICommand { get }
    var submitCommand: ICommand { get }
    var image: Observable<Data?> { get }
    var fullName: Observable<String?> { get }
    var phoneNumber: Observable<String?> { get }
    var email: Observable<String?> { get }
    var cjNumber: Observable<String?> { get }
    var passportOrIdNumber: Observable<String?> { get }
    var isPassportInfoAllowable: Observable<Bool> { get }
    var isPassport: Observable<Bool> { get }
}

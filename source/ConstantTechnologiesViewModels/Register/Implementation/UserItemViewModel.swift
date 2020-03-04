//
//  User.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

struct UserItemViewModel {
    let image: Data?
    let fullName: String
    let phoneNumber: String
    let email: String?
    let cjNumber: String
    let isPassport: Bool
    let passportOrIdNumber: String?
    
    
    init(_ image: Data?,
        _ fullName: String,
         _ phoneNumber: String,
         _ email: String?,
         _ cjNumber: String,
         _ isPassport: Bool,
         _ passportOrIdNumber: String?) {
        self.image = image
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.email = email
        self.cjNumber = cjNumber
        self.isPassport = isPassport
        self.passportOrIdNumber = passportOrIdNumber
    }
}


// MARK: - CustomStringConvertible -

extension UserItemViewModel: CustomStringConvertible {
    var description: String {
        return """
        User's fullName is \(self.fullName),
        phoneNumber is \(self.phoneNumber),
        email is \(self.email ?? "empty"),
        CJ Number is \(self.cjNumber)
        \(self.isPassport ? "Passport" : "ID number") is \(self.passportOrIdNumber ?? "empty")
        """
    }
}

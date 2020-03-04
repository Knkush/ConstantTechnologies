//
//  ICTApiService.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Promises

public protocol ICTApiService {
    func getUsers() -> Promise<[CTUser]>
}

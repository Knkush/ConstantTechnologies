//
//  Optional+Empty.swift
//  ConstantTechnologiesViewModels
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

public extension Optional where Wrapped == String {
    func isNilOrEmpty() -> Bool {
        return self == nil || self!.isEmpty
    }
}

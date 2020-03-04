//
//  PhotoCatchService.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Promises

public protocol IPhotoCatchService {
    func isSourceTypeAvailable(isSourceTypeCamera: Bool) -> Bool
    func catchPhoto(fromCamera: Bool) -> Promise<Data?>
}

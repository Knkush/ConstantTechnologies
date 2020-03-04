//
//  CTUser.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Foundation

public struct CTUser: Codable {
    public let id: Int
    public let name, username, email: String
    public let address: Address
    public let phone, website: String
    public let company: Company
}


// MARK: - Address

public struct Address: Codable {
    public let street, suite, city, zipcode: String
    public let geo: Geo
}


// MARK: - Geo

public struct Geo: Codable {
    public let lat, lng: String
}


// MARK: - Company

public struct Company: Codable {
    public let name, catchPhrase, bs: String
}

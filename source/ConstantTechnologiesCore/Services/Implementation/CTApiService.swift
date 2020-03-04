//
//  CTApiService.swift
//  ConstantTechnologiesCore
//
//  Created by Qnqush on 3/4/20.
//  Copyright © 2020 Qnqush. All rights reserved.
//

import Foundation
import Promises

internal class CTApiService: ICTApiService {
    
    func getUsers() -> Promise<[CTUser]> {
        return self.executeRequest([CTUser].self, URL(string: "https://jsonplaceholder.typicode.com/users")!)
    }
    
    private func executeRequest<T: Decodable>(_ responseType: T.Type, _ url: URL) -> Promise<T> {
        let promise = Promise<T> { fulfill, reject in
            URLSession.shared.dataTask(with: url) { (dataOptional, response, error) in
                guard let data = dataOptional, error == nil else { reject(error ?? NSError() ); return }
                
                let decoder = JSONDecoder()
                let responseT = try! decoder.decode(T.self, from: data)
                
                fulfill(responseT)
            }.resume()
        }
        return promise
    }
}

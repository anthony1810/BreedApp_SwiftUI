//
//  DogAPIResponse.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation

struct APIResponse<Data: Decodable>: Decodable {
    let message: Data
    let status: String
}

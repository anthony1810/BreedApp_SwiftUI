//
//  DogAPIResponse.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation

struct APIResponse<Message: Decodable>: Decodable {
    let message: Message
    let status: String
}

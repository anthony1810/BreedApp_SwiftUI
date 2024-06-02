//
//  DisplayableError.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation

struct DisplayableError: Identifiable, LocalizedError {
    let id: UUID = .init()
    let underlying: Error?
    let message: String
    
    init(underlying: Error?, message: String) {
        self.underlying = underlying
        self.message = message
    }
    
    var errorDescription: String? {
        message
    }
}

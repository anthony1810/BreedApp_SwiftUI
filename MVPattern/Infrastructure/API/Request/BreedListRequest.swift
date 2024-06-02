//
//  BreedListRequest.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation

extension API {
    struct BreedListRequest: APIRequest {
        typealias Message = BreedList
        
        var path: String = "breeds/list/all"
        
        var method: String = "GET"
        
        init() {}
    }
}

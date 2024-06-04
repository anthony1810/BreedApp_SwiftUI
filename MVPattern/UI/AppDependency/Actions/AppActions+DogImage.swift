//
//  AppActions+DogImage.swift
//  MVPattern
//
//  Created by Anthony Tran on 3/6/24.
//

import Foundation
extension AppActions {
    struct DogImageGetter {
        var getImage: (DogImage) async throws -> DogImageResouce = emptyAction(throwing: .message("Unimplemented"))
    }
}

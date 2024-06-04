//
//  DogImageService.swift
//  MVPattern
//
//  Created by Anthony Tran on 4/6/24.
//

import Foundation
import RealmSwift

final class DogImageService {
    private let api: APIClient
    
    init(api: APIClient) {
        self.api = api
    }
    
    func getImage(_ image: DogImage) async throws -> DogImageResouce {
        switch image {
        case .random:
            return .remote(try await api.execute(API.RandomImageRequest.Single.Get()).message)
        case let .breed(breed):
            return try await getDogBreedImage(breed: breed)
        }
    }
    
    func getDogBreedImage(breed: ConcreteBreed) async throws -> DogImageResouce {
        if let subBreed = breed.subBreed {
            return DogImageResouce.remote(
            try await  api.execute(API.SubBreedImageRequest.Random.Single.Get(breed: breed.breed, subBreed: subBreed)).message
            )
        } else {
            return DogImageResouce.remote(
                try await api.execute(
                     API.BreedImageRequest.Random.Single.Get(breed: breed.breed)
                ).message
            )
        }
    }
}

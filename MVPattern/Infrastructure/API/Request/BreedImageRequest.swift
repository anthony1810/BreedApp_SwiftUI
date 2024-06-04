//
//  BreedImageRequest.swift
//  MVPattern
//
//  Created by Anthony Tran on 4/6/24.
//

import Foundation
extension API {
    enum BreedImageRequest {
        enum All {
            struct Get: APIRequest {
                typealias Message = [URL]
                
                var path: String {
                    "breed/\(breed)/images"
                }
                
                var method = "GET"
                
                let breed: Breed
                
                init(breed: Breed) {
                    self.breed = breed
                }
            }
        }
        
        enum Random {
            enum Single {
                struct Get: APIRequest {
                    typealias Message = URL
                    
                    var path: String {
                        "breed/\(breed)/images/random"
                    }
                    
                    let method = "GET"
                    
                    let breed: Breed
                    
                    init(breed: Breed) {
                        self.breed = breed
                    }
                }
            }
            
            enum Multiple {
                struct Get: APIRequest {
                    typealias Message = [URL]
                    
                    var path: String {
                        "breed/\(breed)/images/random/\(count)"
                    }
                    
                    var method: String = "GET"
                    
                    let count: Int
                    
                    let breed: Breed
                    
                    init(count: Int, breed: Breed) {
                        self.count = count
                        self.breed = breed
                    }
                }
            }
        }
    }
    
    enum SubBreedImageRequest {
        public enum All {
            public struct Get: APIRequest {
                public typealias Message = [URL]
                
                public var path: String { "breed/\(breed)/\(subBreed)/images" }
                
                public let method = "GET"
                
                public let breed: Breed
                
                public let subBreed: SubBreed
                
                public init(breed: Breed, subBreed: SubBreed) {
                    self.breed = breed
                    self.subBreed = subBreed
                }
            }
        }
        
        public enum Random {
            public enum Single {
                public struct Get: APIRequest {
                    public typealias Message = URL
                    
                    public var path: String { "breed/\(breed)/\(subBreed)/images/random" }
                    
                    public let method = "GET"
                    
                    public let breed: Breed
                    
                    public let subBreed: SubBreed
                    
                    public init(breed: Breed, subBreed: SubBreed) {
                        self.breed = breed
                        self.subBreed = subBreed
                    }
                }
            }
            
            public enum Multiple {
                public struct Get: APIRequest {
                    public typealias Message = [URL]
                    
                    public var path: String { "breed/\(breed)/\(subBreed)/images/random/\(count)" }
                    
                    public let method = "GET"
                    
                    public let breed: Breed
                    
                    public let subBreed: SubBreed
                    
                    public let count: Int
                    
                    public init(breed: Breed, subBreed: SubBreed, count: Int) {
                        self.breed = breed
                        self.subBreed = subBreed
                        self.count = count
                    }
                }
            }
        }
    }
}

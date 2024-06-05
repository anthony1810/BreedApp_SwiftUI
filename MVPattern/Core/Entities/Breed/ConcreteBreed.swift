//
//  ConcreteBreed.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

struct ConcreteBreed: Hashable {
    let breed: Breed
    
    let subBreed: SubBreed?
    
    init(breed: Breed, subBreed: SubBreed?) {
        self.breed = breed
        self.subBreed = subBreed
    }
}

extension ConcreteBreed {
    public struct BreedNameFormatStyle: FormatStyle {
        let locale: Locale?
        
        public init(locale: Locale? = nil) {
            self.locale = locale
        }
        
        public func locale(_ locale: Locale) -> ConcreteBreed.BreedNameFormatStyle {
            .init(locale: locale)
        }
        
        public func format(_ value: ConcreteBreed) -> String {
            if let subBreed = value.subBreed {
                return "\(subBreed) \(value.breed)".capitalized(with: locale)
            } else {
                return value.breed.capitalized(with: locale)
            }
        }
    }
}

extension ConcreteBreed {
    public func formatted<F: FormatStyle>(_ format: F) -> F.FormatOutput where F.FormatInput == Self {
        format.format(self)
    }
}

extension FormatStyle where Self == ConcreteBreed.BreedNameFormatStyle {
    static var breedName: Self {
        .init(locale: nil)
    }
}

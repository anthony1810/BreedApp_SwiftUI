//
//  File.swift
//  MVPattern
//
//  Created by Anthony Tran on 23/5/24.
//

import Foundation
import SwiftUI
import RealmSwift

public final class MVLiveApp: AppContainer {
    struct Configuration {
        
        let apiBaseURL: URL
        let realmConfig = Realm.Configuration.defaultConfiguration
        
        init(apiBaseURL: URL) {
            self.apiBaseURL = apiBaseURL
        }
    }
    
    // App Configurations
    let configuration: Configuration
    
    // Dependencies
    var app: AppDependency
    
    // Infrastructure
    let api: APIClient
    
    // Services
    let breedListService: BreedsListService
    let dogImageService: DogImageService
    let favoritesService: FavoritesService
    
    init(configuration: Configuration) {
        self.configuration = configuration
        
        self.app = .init(state: .init(), actions: .init())
        self.api = .init(
            session: .shared,
            configuration: .init(baseURL: configuration.apiBaseURL)
        )
        
        // Init services
        self.breedListService = .init(
            api: api, 
            realmConfiguration: self.configuration.realmConfig,
            errorAlert: app.state.errorAlert
        )
        self.dogImageService = .init(api: api)
        self.favoritesService = .init(realmConfiguration: self.configuration.realmConfig, errorState: app.state.errorAlert)
        
        // init actions
        self.app.actions.breedList.refresh = breedListService.fetchList
        
        self.app.actions.dogImage.getImage = self.dogImageService.getImage(_:)
        
        self.app.actions.favorites.connect = self.favoritesService.connect(state:resource:)
        self.app.actions.favorites.favorite = self.favoritesService.favorite(resource:)
        self.app.actions.favorites.unfavorite = self.favoritesService.unfavorite(resource:)
        self.app.actions.favorites.reset = self.favoritesService.reset
    }
    
    func makeBreedListScreenFactory() -> some BreedListScreenFactory {
        RealmBreedListScreenFactory(realmConfiguration: configuration.realmConfig)
    }
    
    func makeFavoritesScreenFactory() -> some FavoritesScreenFactory {
        RealmFavoritesScreenFactory(realmConfiguration: configuration.realmConfig)
    }
}

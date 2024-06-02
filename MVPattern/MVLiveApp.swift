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
        
        // init actions
        self.app.actions.breedList.refresh = breedListService.fetchList
    }
    
    func makeBreedListScreenFactory() -> some BreedListScreenFactory {
        RealmBreedListScreenFactory(realmConfiguration: configuration.realmConfig)
    }
}

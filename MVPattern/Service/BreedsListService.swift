//
//  BreedsListService.swift
//  MVPattern
//
//  Created by Anthony Tran on 24/5/24.
//

import Foundation
import RealmSwift

final class BreedsListService {
    
    private let api: APIClient
    private let realmConfiguration: Realm.Configuration
    
    private var lastRefresh = Date.distantPast
    private var errorAlert: AppState.ErrorAlert
    
    init(
        api: APIClient,
        realmConfiguration: Realm.Configuration,
        lastRefresh: Date = Date.distantPast,
        errorAlert: AppState.ErrorAlert) 
    {
        self.api = api
        self.realmConfiguration = realmConfiguration
        self.lastRefresh = lastRefresh
        self.errorAlert = errorAlert
    }
    
    func fetchList() async {
        guard Date.now.timeIntervalSince(lastRefresh) > 60
        else { return }
        
        do {
            let breeds = try await api.execute(API.BreedListRequest()).message
            lastRefresh = .now
            try self.persist(breeds: breeds.map())
        } catch is CancellationError {
            
        } catch {
            errorAlert.alert = .init(
                underlying: error,
                message: "could not fetch breed list"
            )
        }
    }
    
    func persist(breeds: [BreedListItem]) throws {
        let realm = try Realm(configuration: realmConfiguration)
        try realm.write {
            let list = realm.objects(RealmBreedList.self).first
            ?? realm.create(RealmBreedList.self)
            
            realm.delete(realm.objects(RealmBreed.self))
            
            list.breeds.append(objectsIn: breeds.map { RealmBreed(entity: $0)})
        }
    }
}

//
//  MVPatternApp.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import SwiftUI

@main
struct MVPatternApp: App {
    
    static var configuration: MVLiveApp.Configuration {
        .init(apiBaseURL: .init(string: "https://dog.ceo/api")!)
    }
    
    @State var container = MVLiveApp(configuration: configuration)
    
    var body: some Scene {
        WindowGroup {
            container.app
        }
    }
}

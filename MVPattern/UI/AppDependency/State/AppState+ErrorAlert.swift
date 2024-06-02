//
//  AppState+ErrorAlert.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation

extension AppState {
    final class ErrorAlert: ObservableObject {
        @Published var alert: DisplayableError?
        
        init() {}
    }
}

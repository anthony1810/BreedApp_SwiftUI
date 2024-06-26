//
//  TaskFailedView.swift
//  MVPattern
//
//  Created by Anthony Tran on 4/6/24.
//

import SwiftUI

struct TaskFailedView: View {
    let errorDescription: String
    
    var body: some View {
        VStack {
            Image(systemName: "xmark")
                .symbolRenderingMode(.multicolor)
                .imageScale(.large)
                .padding()
            Text(errorDescription)
        }
    }
}

#Preview {
    TaskFailedView(errorDescription: "could not fetch data")
}

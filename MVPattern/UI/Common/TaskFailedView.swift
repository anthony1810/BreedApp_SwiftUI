//
//  TaskFailedView.swift
//  MVPattern
//
//  Created by Anthony Tran on 4/6/24.
//

import SwiftUI

struct TaskFailedView: View {
    var body: some View {
        Image(systemName: "xmark")
            .symbolRenderingMode(.multicolor)
            .imageScale(.large)
            .padding()
    }
}

#Preview {
    TaskFailedView()
}

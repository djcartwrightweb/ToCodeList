//
//  ToCodeListApp.swift
//  ToCodeList
//
//  Created by David Cartwright on 2025-01-23.
//

import SwiftUI

@main
struct ToCodeListApp: App {
    
    @State private var vm = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {            
                ListView()
//                    .preferredColorScheme(.dark)
            }
            .environment(vm)
        }
    }
}

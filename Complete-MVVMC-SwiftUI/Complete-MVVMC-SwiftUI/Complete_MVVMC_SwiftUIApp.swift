//
//  Complete_MVVMC_SwiftUIApp.swift
//  Complete-MVVMC-SwiftUI
//
//  Created by Alexander Kovalenko on 30.03.23.
//

import SwiftUI

@main
struct Complete_MVVMC_SwiftUIApp: App {
    
    init() {
        UserDefaultsService()
    }
    
    var body: some Scene {
        WindowGroup {
            CustomTabView(coordinator: CustomTabViewCoordinator())
        }
    }
}

//
//  myFirstAppApp.swift
//  myFirstApp
//
//  Created by Mael Chariault on 06/08/2023.
//

import SwiftUI

@main
struct myFirstAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .colorScheme(.light)
                .accentColor(.black)
        }
    }
}

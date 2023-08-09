//
//  Layout.swift
//  myFirstApp
//
//  Created by Mael Chariault on 09/08/2023.
//

import SwiftUI

struct NavigationTab: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                Label("Accueil", systemImage: "house.fill")
            }
        }
    }
}

struct Layout_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTab()
    }
}

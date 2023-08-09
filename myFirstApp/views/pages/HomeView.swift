//
//  ContentView.swift
//  myFirstApp
//
//  Created by Mael Chariault on 06/08/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Accueil",systemImage: "house.fill")
                }
            SwiftUIView()
                .tabItem {
                    Label("test", systemImage: "testtube.2")
                }
        }
    }
}

struct Home: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Bienvenue sur ma première application ios")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.purple)
                Spacer()
                NavigationLink(
                    destination: TeamsView(),
                    label: {
                        HStack {
                            Image(systemName: "person.3.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.green, .purple)
                            Text("Nos Équipes")
                                .foregroundColor(.blue)
                                .font(.title2)
                        }
                    }
                )
                Spacer()
            }
            .navigationBarTitle("My First App")
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(.green)
            .tabItem {
                Text("test")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

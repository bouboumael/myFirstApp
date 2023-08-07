//
//  Team.swift
//  myFirstApp
//
//  Created by Mael Chariault on 07/08/2023.
//

import SwiftUI

struct TeamView: View {
    
    var allteams: [teams] = [.E1, .E2, .E3]
    
    func team (equipe: teams) -> Text {
        switch equipe {
        case .E1:
            return Text("Equipe 1")
        case .E2:
            return Text("Equipe 2")
        case .E3:
            return Text("Equipe 3")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(allteams, id: \.self)
                { teamName in team(equipe: teamName)}
            }.navigationTitle("Teams")
        }
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}

struct Team {
    let teamName: String
    var numberOfTeamate: Int
    var start: String
    var end: String
}

enum teams {
    case E1
    case E2
    case E3
}



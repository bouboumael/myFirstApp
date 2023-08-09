//
//  Team.swift
//  myFirstApp
//
//  Created by Mael Chariault on 07/08/2023.
//

import SwiftUI

struct TeamsView: View {
    
    var body: some View {
        VStack {
            ForEach(teamsData) { team in teamLoop(team: team)}
        }
    }
    
}

extension TeamsView {
    
    private var imageSize: CGFloat {
            return 130.0
        }
    
    private var teamsData : [Team] {
        [
            Team(teamName: "E1", numberOfTeamate: 22, start: "06:00", end: "13:00"),
            Team(teamName: "E2", numberOfTeamate: 22, start: "13:00", end: "20:00"),
            Team(teamName: "E3", numberOfTeamate: 20, start: "20:00", end: "01:20 - 04:20"),
        ]
    }
    
    private func teamLoop(team: Team) -> some View {
        ZStack {
            NavigationLink{
                TeamDescriptionView(team: team)
            } label: {
                HStack {
                    Image("mbo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize, height: imageSize)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Équipe " + team.teamName)
                        Text("Nombre de coéquipiers: \(team.numberOfTeamate)")
                        Text("heure de début: \(team.start)")
                        Text("heure de fin: \(team.end)")
                    }
                    .foregroundColor(.primary)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.primary)
                }
            }
            .padding()
            .background(Color("testColor"))
            .cornerRadius(30)
            .shadow(color: Color.black.opacity(0.6), radius: 5, x: 0, y: 3)
            .padding()
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Nos équipes")
    }

}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}


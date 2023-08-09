import SwiftUI

struct TeamDescriptionView: View {
    let team: Team
    let imageSize = 200.0
    
    var body: some View {
        ScrollView {
            VStack {
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
                .padding()
                Spacer()
                VStack(alignment: .leading) {
                    CollaboratorsView(teamCollaborators: team.numberOfTeamate)
                }
                .frame(maxWidth: .infinity, alignment: .leading) // Aligner le contenu à gauche
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.automatic)
        .navigationTitle(team.teamName)
    }
}

struct TeamDescriptionView_Previews: PreviewProvider {
    static var team = Team(teamName: "E1", numberOfTeamate: 22, start: "06:00", end: "13:00")
    
    static var previews: some View {
        NavigationView {
            TeamDescriptionView(team: team)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(team.teamName)
        }
    }
}

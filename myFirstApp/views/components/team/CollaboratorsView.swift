//
//  CollaboratorView.swift
//  myFirstApp
//
//  Created by Mael Chariault on 09/08/2023.
//

import SwiftUI

struct CollaboratorsView: View {
    var teamCollaborators: Int
    let imageSize = 90.0
    var randomUserTask = RandomUserTask()
    @State var users: [Collaborators] = []
    
    var body: some View {
        VStack {
            ForEach(users) { user in
                CollaboratorView(user: user)
            }
        }
        .onAppear {
            Task {
                users = await randomUserTask.fetchFakeUsers(teamCollaborators)
            }
        }
    }
}


struct CollaboratorView_Previews: PreviewProvider {
    static var previews: some View {
        CollaboratorsView(teamCollaborators: 5)
    }
}

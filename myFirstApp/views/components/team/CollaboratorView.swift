//
//  Collaborator.swift
//  myFirstApp
//
//  Created by Mael Chariault on 09/08/2023.
//

import SwiftUI

struct CollaboratorView: View {
    let user: Collaborators
    let imageSize = 90.0
    var body: some View {
        HStack {
            AsyncImage(url: user.imageURL) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            Spacer()
            Text(user.fullName)
            Spacer()
        }
        .padding()
        .background(Color("testColor"))
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.6), radius: 5, x: 0, y: 3)
        .padding()
    }
}

struct Collaborator_Previews: PreviewProvider {
    static var previews: some View {
        CollaboratorView(user: Collaborators(urlString: "https://randomuser.me/api/portraits/women/2.jpg", lastname: "String", firstname: "String"))
    }
}

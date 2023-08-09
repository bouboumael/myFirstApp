//
//  CollaboratorView.swift
//  myFirstApp
//
//  Created by Mael Chariault on 09/08/2023.
//

import SwiftUI

struct UserInfo {
    let firstname: String
    let lastname: String
}

struct CollaboratorView: View {
    let imageSize = 90.0
    @StateObject private var randomUserTask = RandomUserTask()
    
    var body: some View {
        HStack {
            if let imageURL = randomUserTask.userImageURL {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: imageSize, height: imageSize)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                Text(randomUserTask.userFullName)
            }
        }
        .onAppear {
            Task {
                await randomUserTask.fetchUserImage()
            }
        }
    }
}


struct CollaboratorView_Previews: PreviewProvider {
    static var previews: some View {
        CollaboratorView()
    }
}

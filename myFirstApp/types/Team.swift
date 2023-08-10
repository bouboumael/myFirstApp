//
//  Team.swift
//  myFirstApp
//
//  Created by Mael Chariault on 07/08/2023.
//

import Foundation

struct Team: Identifiable {
    let id = UUID()
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

struct Collaborators: Identifiable {
    let id = UUID()
    var imageURL: URL
    var lastname: String
    var firstname: String
    
    var fullName: String {
        return "\(lastname) \(firstname)"
    }
    
    init(urlString: String, lastname: String, firstname: String) {
        if let url = URL(string: urlString) {
            self.imageURL = url
        } else {
            self.imageURL = URL(string: "https://randomuser.me/api/portraits/women/2.jpg")!
        }
        
        self.lastname = lastname
        self.firstname = firstname
    }
}

struct RandomUsersResponse: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable {
    let picture: UserProfilePicture
    let name: UserProfileName
}

struct UserProfilePicture: Codable {
    let large: String
}

struct UserProfileName: Codable {
    let first: String
    let last: String
}




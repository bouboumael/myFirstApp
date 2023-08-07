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



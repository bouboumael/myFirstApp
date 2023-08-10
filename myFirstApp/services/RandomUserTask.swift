import SwiftUI

class RandomUserTask: ObservableObject {
        
    func fetchFakeUsers(_ numberOfUsers: Int) async -> [Collaborators] {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://randomuser.me/api/?nat=fr&results=\(numberOfUsers)")!)
            let decodedResponse = try JSONDecoder().decode(RandomUsersResponse.self, from: data)
            
            return decodedResponse.results.map { user in
                return Collaborators(urlString: user.picture.large, lastname: user.name.last, firstname: user.name.first)
            }
        } catch {
            print("Error fetching data: \(error)")
            return [] // Return an empty array in case of error
        }
    }
}

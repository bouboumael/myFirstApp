import SwiftUI

class RandomUserTask: ObservableObject {
    @Published var userImageURL: URL?
    @Published var userFullName: String = ""
    
    func fetchUserImage() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://randomuser.me/api/?nat=fr")!)
            let decodedResponse = try JSONDecoder().decode(RandomUserResponse.self, from: data)
            
            if let user = decodedResponse.results.first {
                if let thumbnailURLString = user.picture.large,
                   let thumbnailURL = URL(string: thumbnailURLString) {
                    // Utiliser receive(on:) pour effectuer la mise à jour sur le thread principal
                    DispatchQueue.main.async {
                        self.userImageURL = thumbnailURL
                    }
                }
                
                // Récupérer le prénom et le nom de l'utilisateur
                let firstName = user.name.first
                let lastName = user.name.last
                // Utiliser receive(on:) pour effectuer la mise à jour sur le thread principal
                DispatchQueue.main.async {
                    self.userFullName = "\(firstName) \(lastName)"
                }
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

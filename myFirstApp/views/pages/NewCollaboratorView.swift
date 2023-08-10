import SwiftUI
import CoreData

struct NewCollaboratorView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var lastname: String = ""
    @State private var firstname: String = ""
    @State private var imageUrl: String = ""
    
    var body: some View {
        let imageSize = 200.0
        VStack {
            Image("mbo")
                .resizable()
                .scaledToFit()
                .frame(width: imageSize, height: imageSize)
            Text("Nouveau Collaborateur")
                .font(.title)
                .underline()
            Spacer().frame(height: 50)
            TextField("Nom", text: $lastname)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            TextField("Prénom", text: $firstname)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.bottom, 10)
            
            TextField("Url de la photo", text: $imageUrl)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            Spacer().frame(height: 50)
            Button("Enregistrer") {
                saveCollaborator()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding(.horizontal, 50)
    }
    
    private func saveCollaborator() {
        withAnimation {
            let newCollaborator = Collaborator(context: viewContext)
            newCollaborator.lastname = lastname
            newCollaborator.firstname = firstname
            newCollaborator.imageUrl = imageUrl

            do {
                try viewContext.save()
                // Réinitialisez les champs après avoir enregistré
                lastname = ""
                firstname = ""
                imageUrl = ""
            } catch {
                // Gérer les erreurs ici
                print("Error saving: \(error)")
            }
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NewCollaboratorView()
    }
}

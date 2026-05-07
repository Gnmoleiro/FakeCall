import SwiftUI

struct ContactosView: View {
    @State var contactos: [ContactoModel] = []
    @State var contactoS: ContactoModel?
    
    var groupedContacts: [String: [ContactoModel]] {
        let sorted = contactos.sorted { $0.nome < $1.nome }
        
        return Dictionary(grouping: sorted) { contacto in
            String(contacto.nome.prefix(1)).uppercased()
        }
    }
    
    var body: some View {
        Group {
            if contactos.isEmpty {
                VStack {
                    Text("Nenhum contacto")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(groupedContacts.keys.sorted(), id: \.self) { key in
                        Section(header: Text(key)) {
                            ForEach(groupedContacts[key]!) { contacto in
                                ContactoItemView(contactos: contacto, selected: contacto.id == contactoS?.id)
                                    .listRowInsets(EdgeInsets())
                                    .onTapGesture {
                                        if contactoS?.id != contacto.id {
                                            contactoS = contacto
                                            ContactoSelected().save(contactos: contactoS!)
                                        } else {
                                            contactoS = nil
                                            ContactoSelected().clear()
                                        }
                                    }
                                    .swipeActions(edge: .leading) {
                                        Button(role: .destructive) {
                                        if let index = contactos.firstIndex(where: { $0.id == contacto.id })
                                        {
                                            if contactoS?.id == contacto.id {
                                                ContactoSelected().clear()
                                            }
                                            contactos.remove(at: index)
                                            save()
                                        }
                                        } label: {
                                            Label("Apagar", systemImage: "trash")
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            contactos = ContactosManage().load()
            contactoS = ContactoSelected().load()
        }
    }
    
    func save() {
        ContactosManage().saveArray(contactos: contactos)
    }
}

#Preview {
    let contactoS: [ContactoModel] = [
        ContactoModel(id: UUID(), nome: "João", numero: "+351 123 456 789", color: "fff"),
        ContactoModel(id: UUID(), nome: "Maria", numero: "+351 987 654 321", color: "fff"),
    ]
    ContactosView(contactos: contactoS)
}

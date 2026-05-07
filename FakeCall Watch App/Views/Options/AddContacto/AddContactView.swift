import SwiftUI

struct AddContactView: View {
    @State private var nomeContacto: String = ""
    @State private var numContacto: String = ""
    @State private var cor: String = "#1F77B4"
    @State private var full: Bool = false
    @Binding var tag: TabManage.TabViewTag
    
    var body: some View {
        ScrollView {
            TextFieldContactoView(nome: $nomeContacto, numero: $numContacto, cor: $cor)
                .onChange(of: nomeContacto) { _ in checkFields() }
                .onChange(of: numContacto) { _ in checkFields() }
                .onChange(of: cor) { _ in checkFields() }
            
            GuardarContactoView(isDisabled: !full, action: saveContact)
        }
        .navigationTitle("Adicionar")
    }
    
    private func checkFields() {
        full = !nomeContacto.isEmpty && validPhoneNumber(numero: numContacto)
    }
    
    private func validPhoneNumber(numero: String) -> Bool {

        return numero.count == 9 && numero.allSatisfy { $0.isNumber }

    }
    
    private func saveContact() {
        ContactosManage().save(contactos:
            ContactoModel(
                id: UUID(),
                nome: nomeContacto,
                numero: numContacto,
                color: cor
            )
        )
        nomeContacto = ""
        numContacto = ""
        full = false
        tag = TabManage.TabViewTag.contactos
    }
}

#Preview {
    AddContactView(tag: .constant(.contactos))
}

import SwiftUI

struct ContactoItemView: View {
    var contactos: ContactoModel
    var selected: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            
            AvatarContactoView(contacto: contactos, size: 45, fontStyleType: .semibold)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(contactos.nome)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                Text(contactos.numero)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 6)
        .padding(.horizontal, 4)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(selected ? Color.green.opacity(0.15) : Color.clear)
        )
        .contentShape(Rectangle())
    }
}

#Preview {
    let contactoS = ContactoModel(id: UUID(), nome: "João", numero: "+351 999 999 999", color: "#fff")
    ContactoItemView(contactos: contactoS, selected: false)
}

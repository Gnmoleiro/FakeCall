import SwiftUI

struct TextFieldContactoView: View {
    @Binding var nome: String
    @Binding var numero: String
    @Binding var cor: String
    
    @State private var selectedIndex: Int = 0
    let coresHex: [String] = [
        "#1F77B4", "#2CA02C", "#D62728", "#9467BD", "#FF7F0E",
        "#8C564B", "#E377C2", "#7F7F7F", "#BCBD22", "#17BECF",
        "#AEC7E8", "#98DF8A", "#FFBB78", "#C49C94", "#F7B6D2"
    ]
    
    @FocusState private var focusedField: Field?
    
    enum Field {
        case nome
        case numero
    }

    var coresDisponiveis: [Color] {
        coresHex.map { Color(hex: $0) }
    }
    
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 8) {
                TextField("Nome", text: $nome)
                    .padding(.vertical, 2)
                    .focused($focusedField, equals: .nome)
                
                TextField("Número", text: $numero)
                    .padding(.vertical, 2)
                    .focused($focusedField, equals: .numero)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(0..<coresDisponiveis.count, id: \.self) { index in
                            Circle()
                                .fill(coresDisponiveis[index])
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Circle()
                                        .stroke(selectedIndex == index ? Color.white : Color.clear, lineWidth: 3)
                                        .shadow(color: selectedIndex == index ? .white.opacity(0.7) : .clear, radius: 2)
                                )
                                .onTapGesture {
                                    selectedIndex = index
                                    cor = coresHex[index]
                                    focusedField = nil // remove foco do teclado
                                }
                                .scaleEffect(selectedIndex == index ? 1.2 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: selectedIndex)
                        }
                    }
                    .padding(6)
                }
            }
            .padding(.vertical, 4)
        } header: {
            Text("Novo Contacto")
                .font(.title3)
                .fontWeight(.semibold)
                .shadow(color: .gray.opacity(0.4), radius: 2)
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    @Previewable @State var previewNome = "João"
    @Previewable @State var previewNumero = "123456789"
    @Previewable @State var cor = "#1F77B4"
    TextFieldContactoView(nome: $previewNome, numero: $previewNumero, cor: $cor)
}


import SwiftUI

struct OpcoesChamadaView: View {
    var body: some View {
        NavigationLink(
            destination: OptionsView()
                .navigationTitle("Opções")
        ) {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 44, height: 44)

                Image(systemName: "ellipsis")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        OpcoesChamadaView()
    }
}

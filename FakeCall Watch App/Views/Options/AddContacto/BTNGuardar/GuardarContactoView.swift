import SwiftUI

struct GuardarContactoView: View {
    let isDisabled: Bool
    let action: () -> Void
    @State private var attempts: Int = 0
    var body: some View {
        VStack {
            Button {
                if isDisabled {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        attempts += 1
                        print(attempts)
                    }
                } else {
                    action()
                }
            } label: {
                Label("Guardar", systemImage: "checkmark.circle.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
            .foregroundColor(isDisabled ? .gray : .green)
            .modifier(ShakeAnimacao(animatableData: CGFloat(attempts)))
        }
    }
}

#Preview {
    GuardarContactoView(isDisabled: true, action: { print("a") })
}

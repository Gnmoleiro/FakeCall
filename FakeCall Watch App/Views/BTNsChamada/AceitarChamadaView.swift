import SwiftUI

struct AceitarChamadaView: View {
    var onReject: () -> Void
    
    var body: some View {
        Button {
            WKInterfaceDevice.current().play(.success)
            onReject()
        } label: {
            ZStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 55, height: 55)
                    .shadow(color: .green.opacity(0.6), radius: 8)

                Image(systemName: "phone.fill")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AceitarChamadaView(onReject: {})
}

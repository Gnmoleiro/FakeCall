import SwiftUI

struct RejeitarChamadaView: View {
    var onReject: () -> Void
    @State private var sizeButton: Int
    @State private var sizeIcon: Int
    
    init(onReject: @escaping () -> Void, sizeButton: Int, sizeIcon: Int) {
        self.onReject = onReject
        self._sizeButton = State(initialValue: sizeButton)
        self._sizeIcon = State(initialValue: sizeIcon) // ← usar sizeIcon aqui
    }
    
    var body: some View {
        Button {
            WKInterfaceDevice.current().play(.failure)
            onReject()


        } label: {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: CGFloat(sizeButton), height: CGFloat(sizeButton))

                Image(systemName: "phone.down.fill")
                    .font(.system(size: CGFloat(sizeIcon), weight: .bold))
                    .foregroundStyle(.white)
            }
        }
        .buttonStyle(.plain)
        
    }
}

#Preview {
    RejeitarChamadaView(onReject: {}, sizeButton: 55, sizeIcon: 26)
}

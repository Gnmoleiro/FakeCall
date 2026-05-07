import SwiftUI

struct MuteChamadaView: View {
    @Binding var isMuted: Bool
    
    var body: some View {
        Button {
            isMuted.toggle()
        } label: {
            ZStack {
                Circle()
                    .fill(isMuted ? Color.white.opacity(0.25) : Color.white.opacity(0.15))
                    .frame(width: 44, height: 44)
                
                Image(systemName: isMuted ? "mic.slash.fill" : "mic.fill")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
        }
        .buttonStyle(.plain)
        .scaleEffect(isMuted ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.15), value: isMuted)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        MuteChamadaView(isMuted: .constant(true))
    }
}

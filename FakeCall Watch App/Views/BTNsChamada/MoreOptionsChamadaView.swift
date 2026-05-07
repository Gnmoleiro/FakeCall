import SwiftUI

struct MoreOptionsChamadaDesignView: View {
    var body: some View {
        Button {} label: {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.15))
                    .frame(width: 44, height: 44)
                    .shadow(color: Color.white.opacity(0.3), radius: 6, x: 0, y: 2)
                Image(systemName: "square.grid.3x3.fill")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MoreOptionsChamadaDesignView()
}

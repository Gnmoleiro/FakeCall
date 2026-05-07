import SwiftUI

struct ContadordeTempoChamadaView: View {
    let startDate: Date = Date()
    
    var body: some View {
        TimelineView(.periodic(from: startDate, by: 1)) { context in
            let elapsed = Int(context.date.timeIntervalSince(startDate))
            
            Text(timeString(from: elapsed))
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .monospacedDigit()
                .foregroundStyle(.white)
                .animation(.bouncy(duration: 0.2), value: elapsed)
        }
    }
    
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
}

#Preview {
    ContadordeTempoChamadaView()
}

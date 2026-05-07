import SwiftUI

struct ConfiguracaoTapsView: View {
    @State private var crownValue: Double = 5
    @FocusState private var focused: Bool
    @Binding var tag: TabManage.TabViewTag
    
    private var numbTaps: Int {
        Int(crownValue.rounded())
    }
    
    var body: some View {
        VStack(spacing: 12) {
            
            Text("\(numbTaps)")
                .font(.system(size: 44, weight: .bold, design: .rounded))
                .contentTransition(.numericText())
                .focusable(true)
                .focused($focused)
                .digitalCrownRotation(
                    $crownValue,
                    from: 1.0,
                    through: 10.0,
                    by: 1.0,
                    sensitivity: .medium,
                    isContinuous: false,
                    isHapticFeedbackEnabled: true
                )
            
            Text(numbTaps == 1 ? "toque" : "toques")
                .font(.caption2)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Button("Guardar") {
                saveNumbTaps()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Configuração")
        .onAppear {
            focused = true
            let configs = ConfigManage().load()
            crownValue = Double(configs?.tapCount ?? 5)
        }
    }
    
    private func saveNumbTaps() {
        ConfigManage().save(config: ConfigModel(
            tapCount: numbTaps
        ))
        tag = TabManage.TabViewTag.contactos
    }
}

#Preview {
    ConfiguracaoTapsView(tag: .constant(.configTaps))
}

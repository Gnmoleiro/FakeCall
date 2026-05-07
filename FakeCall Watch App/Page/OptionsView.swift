
import SwiftUI

struct OptionsView: View {
    
    
    @State private var selection: TabManage.TabViewTag = .contactos
    
    var body: some View {
        TabView(selection: $selection) {
            ContactosView()
                .tag(TabManage.TabViewTag.contactos)
            AddContactView(tag: $selection)
                .tag(TabManage.TabViewTag.addContactos)
            ConfiguracaoTapsView(tag: $selection)
                .tag(TabManage.TabViewTag.configTaps)
        }
        .animation(.easeInOut(duration: 0.5), value: selection)
    }
}

#Preview {
    OptionsView()
}

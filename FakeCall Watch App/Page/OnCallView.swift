import SwiftUI
import WatchKit

struct OnCallView: View {
    @Binding var showCall: Bool
    @Binding var currentTaps: Int
    @Binding var onCall: Bool
    @State var contacto: ContactoModel?
    
    var body: some View {
        ZStack {
            Color(hex: contacto?.color ?? "#fff", opacity: 0.2)
                .blur(radius: 30)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    AvatarContactoView(contacto: contacto, size: 80, fontStyleType: .heavy)
                    
                    if let contacto = contacto {
                        ContadordeTempoChamadaView()
                        Text(contacto.nome)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                            .shadow(color: .gray, radius: 0.5)
                        
                        Spacer()
                    }
                }
                
                ZStack {
                    if contacto != nil {
                        VStack {
                            Spacer()
                            HStack {
                                MuteChamadaView(isMuted: .constant(true))
                                Spacer()
                            }
                            .padding(.leading, 8)
                        }
                        
                        VStack {
                            Spacer()
                            RejeitarChamadaView(onReject: {
                                showCall = false
                                onCall = false
                                currentTaps = 0
                            }, sizeButton: 55, sizeIcon: 26)
                        }
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            MoreOptionsChamadaDesignView()
                        }
                        .padding(.trailing, 8)
                    }
                }
                .onAppear {
                    contacto = ContactoSelected().load()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        let contactos = ContactosManage().load()
        if !contactos.isEmpty {
            OnCallView(
                showCall: .constant(false),
                currentTaps: .constant(0),
                onCall: .constant(false),
                contacto: contactos[0]
            )
        }
    }
}

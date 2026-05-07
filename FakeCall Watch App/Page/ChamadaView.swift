import SwiftUI
import WatchKit

struct ChamadaView: View {
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
                                RejeitarChamadaView (onReject: {
                                    showCall = false
                                    onCall = false
                                    currentTaps = 0
                                }, sizeButton: 44, sizeIcon: 18)
                                Spacer()
                            }
                            .padding(.leading, 8)
                        }
                        
                        VStack {
                            Spacer()
                            AceitarChamadaView{
                                onCall = true
                            }
                        }
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            OpcoesChamadaView()
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
            ChamadaView(
                showCall: .constant(false),
                currentTaps: .constant(0),
                onCall: .constant(false),
                contacto: contactos[0]
            )
        }
    }
}

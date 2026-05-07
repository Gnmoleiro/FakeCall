//
//  AvatarContactoView.swift
//  FakeCall Watch App
//
//  Created by Aluno on 2/28/26.
//

import SwiftUI

struct AvatarContactoView: View {
    var contacto: ContactoModel?
    var size: CGFloat = 85
    var fontStyleType : Font.Weight = .heavy
    
    var body: some View {
        if contacto != nil {
            ZStack {
                Circle()
                    .fill(Color(hex: contacto!.color))
                    .frame(width: size, height: size)
                    .shadow(color: Color(hex: contacto!.color, opacity: 0.5), radius: 5, x: 0, y: 2)
                let letra = contacto!.nome.prefix(1)
                    Text(String(letra))
                        .font(.system(size: size * 0.5, weight: fontStyleType))
                        .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    let contactos = ContactosManage().load()
        if !contactos.isEmpty {
            AvatarContactoView(contacto: contactos[0])
        }
}

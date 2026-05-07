//
//  BlackScreenView.swift
//  FakeCall Watch App
//
//  Created by Aluno on 02/03/2026.
//

import SwiftUI

struct BlackScreenView: View {
    @State var requiredTaps: Int = 0

    @State private var currentTaps = 0
    @State private var showNextView = false
    @State private var onCall = false
    
    var body: some View {
        ZStack {
                if showNextView && !onCall{
                    ChamadaView(showCall: $showNextView, currentTaps: $currentTaps, onCall: $onCall)
                        .transition(.opacity)
                }
            else if showNextView && onCall {
                OnCallView(showCall: $showNextView, currentTaps: $currentTaps, onCall: $onCall)
                    .transition(.opacity)
            }
            else {
                    Color.black
                        .ignoresSafeArea()
                        .onTapGesture {
                            handleTap()
                        }
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut(duration: 0.4), value: showNextView)
            .animation(.easeInOut(duration: 0.4), value: onCall)
            .onAppear {
                let configs = ConfigManage().load()
                requiredTaps = configs?.tapCount ?? 5
            }
    }

    private func handleTap() {
        currentTaps += 1

        if currentTaps >= requiredTaps {
            showNextView = true
        }
    }
}

#Preview {
    BlackScreenView()
}

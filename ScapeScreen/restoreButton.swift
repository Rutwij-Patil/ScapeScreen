//
//  restoreButton.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 26/12/23.
//

import SwiftUI
import PencilKit

struct restoreButton: View {
    
    @Binding var restore: Bool
    @State var counter: Int = 30 // Initial counter value
    @State private var timer: Timer? // Timer to update counter
    var body: some View {
        HStack(spacing: nil) {
            Image(systemName: "arrow.circlepath")

            Text("\(counter)")
                .onAppear() {
                    startTimer()
                }
        }
    }
    
    func startTimer() {
        // Invalidate previous timer if exists
        timer?.invalidate()

        // Create a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if counter > 0 {
                counter -= 1 // Decrement the counter by 1
            } else {
                // Stop the timer when the counter reaches 0
                timer?.invalidate()
                restore = false
            }
        }
    }
}

#Preview {
    restoreButton(restore: .constant(true))
}

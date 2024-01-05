//
//  CreateCanvas.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 29/12/23.
//

import SwiftUI
import SwiftData
import PencilKit


struct CreateCanvas: View {
    
    @Environment (\.modelContext) var context
    
    @State var canvas: Rendition = Rendition(title: "", drawing: PKDrawing().dataRepresentation())
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 20) {
            Text("Canvas Title")
                .font(.title)
                .fontWeight(.bold)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.background)
                TextField("My Canvas", text: $canvas.title)
            }
            .frame(height: 150)
            .padding(.horizontal)
            
            Button {
                context.insert(canvas)
                dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.background)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1.0)
                        )
                    Image(systemName: "checkmark")
                }
                .frame(height: 80)
            }
        }
    }
}


//
//  CanvasView.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 26/12/23.
//

import SwiftUI
import PencilKit

struct CanvasView {
    @Binding var canvasView : PKCanvasView
    @State var canvas: Rendition
    @State var toolPicker = PKToolPicker()
}

extension CanvasView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> PKCanvasView {
        try? canvasView.drawing = PKDrawing(data: canvas.drawing)
        canvasView.tool = PKInkingTool(.pen, color: .brown, width: 10)
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        
        #if targetEnvironment(simulator)
            canvasView.drawingPolicy = .anyInput
        #endif
        
        canvasView.delegate = context.coordinator
        
        showToolPicker()

        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
    
}

extension CanvasView {
    
    class Coordinator: NSObject, PKCanvasViewDelegate {
      var canvasView: Binding<PKCanvasView>
//      let onSaved: () -> Void

      init(canvasView: Binding<PKCanvasView> /*, onSaved: @escaping () -> Void*/) {
        self.canvasView = canvasView
//        self.onSaved = onSaved
      }
        
//        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
//            if !canvasView.drawing.bounds.isEmpty {
//                onSaved()
//            }
//        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(canvasView: $canvasView)
    }
    
}

private extension CanvasView {
    
  func showToolPicker() {
    // 1
    toolPicker.setVisible(true, forFirstResponder: canvasView)
    // 2
    toolPicker.addObserver(canvasView)
    // 3
    canvasView.becomeFirstResponder()
  }
    
}





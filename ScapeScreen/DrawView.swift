//
//  DrawView.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 26/12/23.
//

import SwiftUI
import PencilKit

struct DrawView: View {
    
    @State var rendition: Rendition
    @State private var canvasView = PKCanvasView()
    @State private var previousDrawing = PKDrawing()
    @State var cleared = false
    @State var timer = 0
    @State var toggleRestore = true
    @State var showStencil = false
    var eyeImage: Image {
        if showStencil {
            Image(systemName: "eye")
        } else {
            Image(systemName: "eye.slash")
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if showStencil {
                    Image("flower")
                        .resizable()
                        .opacity(0.4)
                }
                CanvasView(canvasView: $canvasView, canvas: rendition)
            }
            .toolbar {
                ToolbarItem {
                    Button(action: {showStencil.toggle()}, label: {
                        eyeImage
                    })
                }
                ToolbarItem {
                    Button(action: clearDrawing, label: {
                        Image(systemName: "trash")
                    })
                }
                if toggleRestore {
                    if cleared {
                        ToolbarItem {
                            Button(action: restoreDrawing, label: {
                                restoreButton(restore: $cleared)
                                    .foregroundStyle(.red)
                            })
                        }
                    }
                } else {
                    if cleared {
                        ToolbarItem {
                            Button(action: restoreDrawing, label: {
                                restoreButton(restore: $cleared)
                                    .foregroundStyle(.red)
                            })
                        }
                    }
                }
                ToolbarItem {
                    
                }
            }
        }
        .navigationTitle(rendition.title)
    }
}

extension DrawView {
    func clearDrawing() {
        if !canvasView.drawing.bounds.isEmpty {
            previousDrawing = canvasView.drawing
            canvasView.drawing = PKDrawing()
            cleared = true
            toggleRestore.toggle()
        }
    }
}

extension DrawView {
    func restoreDrawing() {
        try? canvasView.drawing = PKDrawing.init(data: rendition.drawing)
            cleared = false
    }
}

#Preview {
    DrawView(rendition: Rendition(title: "MY drawing", drawing: PKDrawing().dataRepresentation()))
}

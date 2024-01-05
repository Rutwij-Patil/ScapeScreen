//
//  SavedCanvasViews.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 29/12/23.
//

import SwiftUI
import SwiftData
import PencilKit

struct SavedCanvasView: View {
    @Query var canvases: [Rendition]
    @State var addCanvas = false
    
    let columns = [
        GridItem(.adaptive(minimum: 180))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(1..<41) {
                        CanvasCardView(canvas: Rendition(title: "Canvas \($0)", drawing: PKDrawing().dataRepresentation()))
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 50, height: 50)
                                .opacity(0.002)
                            Text("+")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .hoverEffect()
                    }
                }
            }
            .navigationTitle("Your Masterpieces")
        }
        
        
    }
}

#Preview {
    SavedCanvasView()
}

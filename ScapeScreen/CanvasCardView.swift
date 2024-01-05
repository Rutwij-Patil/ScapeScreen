//
//  CanvasCardView.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 30/12/23.
//

import SwiftUI
import PencilKit

struct CanvasCardView: View {
    
    @State var canvas: Rendition
    
    var body: some View {
        VStack {
            Image(uiImage: try! PKDrawing(data: canvas.drawing).image(from: PKCanvasView().bounds, scale: 1.0))
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .background(Image("canvas").resizable())
                .frame(width: 180, height: 270)
                .shadow(radius: 10)
            
            Text(canvas.title)
                .font(.title2)
                .fontWeight(.semibold)
            Text("\(canvas.created.formatted(.dateTime))")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    CanvasCardView(canvas: Rendition(title: "HAHA", drawing: PKDrawing().dataRepresentation()))
}

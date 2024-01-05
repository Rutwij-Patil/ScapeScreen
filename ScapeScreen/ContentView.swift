//
//  ContentView.swift
//  ScapeScreen
//
//  Created by Rutwij Patil on 26/12/23.
//

import SwiftUI
import SwiftData
import PencilKit

struct ContentView: View {
    @Environment (\.modelContext) var context
    @Query private var canvases : [Rendition]
    @State var canvas: Rendition! = nil
    @State var newCanvas = Rendition(title: "new Drawing", drawing: PKDrawing().dataRepresentation())
    @State var addCanvas = false
    var body: some View {
        NavigationSplitView{
            VStack {
                List {
                    ForEach(canvases) { canvas in
                        Text(canvas.title)
                            .onTapGesture {
                                self.canvas = canvas
                            }
                    }
                }
                Button() {
                    addCanvas.toggle()
                    context.insert(newCanvas)
                    try? context.save()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(height: 50)
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(.background)
                    }
                    .padding(.trailing)
                    
                }
            }
            .navigationTitle("Your Drawings")
        } detail: {
            if (canvas != nil) {
                DrawView(rendition: canvas!)
            } else {
                Text("Select a canvas")
                    .font(.largeTitle)
            }
        }
        .padding()
        .sheet(isPresented: $addCanvas, content: {
            CreateCanvas()
        })
        
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Attractions
//
//  Created by Seamus O'Mahoney on 5/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var scupltureWorks = sculptureData
    @State private var hideVisited = false
    
    var showSculpture: [SculptureWork] {
      hideVisited ? scupltureWorks.filter { $0.reaction == "" } : scupltureWorks
    }

    private func setReaction(_ reaction: String, for item: SculptureWork) {
      if let index = scupltureWorks.firstIndex(
        where: { $0.id == item.id }) {
        scupltureWorks[index].reaction = reaction
      }
    }

    var body: some View {
      NavigationView {
        List(showSculpture) { sculptureWork in
          NavigationLink(
          destination: DetailView(sculptureWork: sculptureWork)) {
            Text("\(sculptureWork.reaction)  \(sculptureWork.title)")
              .onAppear() { sculptureWork.load() }
              .contextMenu {
                Button("Love it: 💕") {
                  self.setReaction("💕", for: sculptureWork)
                }
                Button("Thoughtful: 🙏") {
                  self.setReaction("🙏", for: sculptureWork)
                }
                Button("Wow!: 🌟") {
                  self.setReaction("🌟", for: sculptureWork)
                }
            }
          }
        }
        
        .navigationBarItems(trailing:
          Toggle(isOn: $hideVisited, label: { Text("Hide Visited") }))
        .navigationTitle("Artworks")
        
        DetailView(sculptureWork: scupltureWorks[0])
      }
      .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

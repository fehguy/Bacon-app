//
//  ContentView.swift
//  Bacon
//
//  Created by Tony Tam on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    @State var videoZones = [VideoZone]()
    @State var zones = [Zone]()
    @State private var state = false

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: TestView(name: "something")) {
                    Text("hello")
                }
                ForEach(videoZones) { item in
                    NavigationLink(destination: VideoView(zone: item, selected: $state)) {
                        Text("\(item.id)")
                    }
                }
                NavigationLink(destination: HeatingView(name: "")) {
                    Text("all heaters")
                }
                ForEach(zones) { item in
                    NavigationLink(destination: MyDetailView(name: item.name)) {
                        Text("\(item.name)")
                    }
                }
            }.onAppear() {
                PVideoZones().loadData{(zones) in
                    self.videoZones = zones
                }
                PZones().loadData{(zones) in
                    self.zones = zones
                }
            }
            Text("Select an item")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

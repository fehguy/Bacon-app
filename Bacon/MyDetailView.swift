//
//  MyDetailView.swift
//  Bacon
//
//  Created by Tony Tam on 12/3/21.
//

import SwiftUI

struct MyDetailView: View {
    var name: String
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SecondView()) {
                    Text("Rooms")
                }
                NavigationLink(destination: LightsView(name: name)) {
                    Text("Lights")
                }
                NavigationLink(destination: HeatingView(name: name)) {
                    Text("Heating")
                }
                NavigationLink(destination: SecondView()) {
                    Text("Music")
                }
                NavigationLink(destination: SecondView()) {
                    Text("Security")
                }
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        Text("Detail view")
            .navigationTitle("title")
            .background(Color.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

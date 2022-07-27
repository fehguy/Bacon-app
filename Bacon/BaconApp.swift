//
//  BaconApp.swift
//  Bacon
//
//  Created by Tony Tam on 12/1/21.
//

import SwiftUI

@main
struct BaconApp: App {
    let location = BaseLocation()

    var body: some Scene {
        //UIApplication.shared.isIdleTimerDisabled = true

        WindowGroup {
            ContentView()
        }
    }
}

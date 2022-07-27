//
//  VideoView.swift
//  Bacon
//
//  Created by Tony Tam on 12/3/21.
//

import SwiftUI
import VLCKit

struct VideoView: View {
    @Binding var isSelected: Bool
    let player: VLCPlayer
    let zone: VideoZone
    
    init(zone: VideoZone, selected: Binding<Bool>) {
        self._isSelected = selected
        self.zone = zone
        self.player = VLCPlayer(url: zone.url)
    }
    
    var body: some View {
        player
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.stop()
            }
    }
}

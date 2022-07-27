//
//  VLCPlayer.swift
//  TestVLCKIT
//
//  Created by Denis Blondeau on 2021-05-21.
//

import SwiftUI
import VLCKit

struct VLCPlayer: NSViewRepresentable {
    func makeCoordinator() -> Coordinator {
//        print("make coordinator")
        return Coordinator(self)
    }
    
    let player = VLCMediaPlayer()
    private var media: VLCMedia!

    init(url: String) {
        let mediaURL = URL(string: url)
        if let mediaURL = mediaURL {
            media = VLCMedia(url: mediaURL)
            player.media = media
            
        }
    }
    
    init(url: URL) {
        media = VLCMedia(url: url)
        player.media = media
        let audio = player.audio
        audio?.setMute(true)
//        audio = VLCAudio()
    }
    
    func makeNSView(context: NSViewRepresentableContext<VLCPlayer>) -> VLCVideoView {
//        print("make makeNSView")
        let vlcView = VLCVideoView()
        player.drawable = vlcView
        
        player.media?.delegate = context.coordinator
        player.libraryInstance.debugLoggingTarget = context.coordinator
        
        NotificationCenter.default.addObserver(forName: NSApplication.willTerminateNotification, object: nil, queue: .main) {  _ in
            if player.isPlaying {
                player.stop()
            }
        }
        
        player.scaleFactor = 2
        
        return vlcView
    }
    
    func updateNSView(_ vlcView: VLCVideoView, context: NSViewRepresentableContext<VLCPlayer>) {
//        print("updateNSView")
    }
    
    class Coordinator: NSObject, VLCLibraryLogReceiverProtocol, VLCMediaDelegate {
        var parent:  VLCPlayer
        
        init(_ parent: VLCPlayer) {
            self.parent = parent
        }

        func handleMessage(_ message: String, debugLevel level: Int32) {
            if message.starts(with: "auto hiding mouse cursor") {
                parent.player.scaleFactor = 0
            }
        }
        
        func mediaDidFinishParsing(_ aMedia: VLCMedia) {
//            print("mediaDidFinishParsing")
        }
        
        func mediaMetaDataDidChange(_ aMedia: VLCMedia) {
//            print("mediaMetaDataDidChange")
        }
    }
}

extension VLCPlayer {
    func play() {
        if !player.isPlaying {
            player.play()
//            player.scaleFactor = 0
        }
    }

    func stop() {
        if player.isPlaying {
            player.stop()
        }
    }
}

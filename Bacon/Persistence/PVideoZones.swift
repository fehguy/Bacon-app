//
//  PVideoZones.swift
//  Bacon
//
//  Created by Tony Tam on 12/3/21.
//

import Foundation


class PVideoZones : ObservableObject {
    @Published var zones = [VideoZone]()
    
    func loadData(completion: @escaping([VideoZone])-> ()) {
        self.zones = [
            VideoZone(id: "Front Yard",
                      url: URL(string:  "rtsp://192.168.86.52:7447/sd8iDX6eYDEpVn6x")!),
            VideoZone(id: "Front Porch",
                      url: URL(string:  "rtsp://baciot:carbon12@192.168.86.200/streaming/channels/01")!),
            VideoZone(id: "Driveway Camera", url:
                        URL(string:  "rtsp://192.168.86.52:7447/wbUSBlRPAkD69hn0")!),
            VideoZone(id: "Back Yard", url:
                        URL(string:  "rtsp://192.168.86.52:7447/2URZkGqi99LNLaBS")!),
            VideoZone(id: "Portable", url:
                        URL(string:  "rtsp://192.168.86.52:7447/EwhD1gZWlrIfPD5r")!)
        ]
        completion(self.zones)
    }
}

struct VideoZone : Identifiable {
    var id: String
    var url: URL
}

//
//  PLights.swift
//  Bacon
//
//  Created by Tony Tam on 12/5/21.
//

import Foundation

class PLights : ObservableObject {
    @Published var zones = [Light]()
    
    func lightsForZone(zone: String, completion: @escaping([Light])-> ()) {
        var lights:[Light] = []
        ZWaveAPI.getLightingSummary { data, error in
            if let data = data {
                let matchingRooms = data.zoneStatus?.filter({ item in
                    return item.zone == zone
                })
                matchingRooms?.forEach({ zone in
                    let id = zone._id!
                    let name = zone.name!
                    let lightDetails = data.zones?.filter({ zoneDetails in
                        return zoneDetails._id == id
                    })
                    if lightDetails?.count == 1 {
                        let details = lightDetails![0]
                        
                        var state = false
                        var lightLevel: Float = 0.0
                        if let level = zone.level{
                            if level == "on" {
                                state = true
                            }
                            else if level == "off" {
                                state = false
                            }
                            else {
                                lightLevel = Float(level) ?? 0.0
                            }
                        }
                        lights.append(Light(id: id, name: name, state: state, level: lightLevel, type: details.deviceType!))
                    }
                })
            }

            let sorted = lights.sorted { left, right in
                return left.name < right.name
            }
            completion(sorted)
        }
    }
}

struct Light : Identifiable {
    var id: String
    var name: String
    var state: Bool
    var level: Float
    var type: LightingZone.DeviceType
}

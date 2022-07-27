//
//  Persistence.swift
//  Bacon
//
//  Created by Tony Tam on 12/1/21.
//

import Foundation

class PZones : ObservableObject {
    @Published var zones = [Zone]()
    
    func loadData(completion: @escaping([Zone])-> ()) {
        ZonesAPI.getZones { data, error in
            if let data = data {
                self.zones = data.map({ name in
                    return Zone(id: name, name: name)
                })
            }
            completion(self.zones)
        }
    }
}

struct Zone : Identifiable {
    var id: String
    var name: String
}

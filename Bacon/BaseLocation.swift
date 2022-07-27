//
//  BaseLocation.swift
//  Bacon
//
//  Created by Tony Tam on 12/3/21.
//

import Foundation
import Moog

class BaseLocation {
    var moog: Moog = Moog.shared()
    
    init() {
        let location = getLocation()

        if location == "laurel" {
            print("connected to laurel")
            SwaggerClientAPI.basePath = "http://192.168.2.225:8080/api"
        }
        else {
            print("assuming webster")
            SwaggerClientAPI.basePath = "http://192.168.86.225:8080/api"
        }
        
    }
    
    func getLocation() -> String? {
        var address : String?

        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                let name = String(cString: interface.ifa_name)
                // Convert interface address to a human readable string:
                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                            &hostname, socklen_t(hostname.count),
                            nil, socklen_t(0), NI_NUMERICHOST)
                address = String(cString: hostname)
                if address?.starts(with: "192.168.2.") ?? false {
                    return "laurel"
                }
                else if address?.starts(with: "192.168.86.") ?? false {
                    return "webster"
                }
            }
        }
        freeifaddrs(ifaddr)

        return nil
    }
}

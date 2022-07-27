//
// ConfigurationInfo.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ConfigurationInfo: Codable {

    public var myself: DeviceConfig?
    public var devices: [Device]?
    public var config: JSONValue?

    public init(myself: DeviceConfig?, devices: [Device]?, config: JSONValue?) {
        self.myself = myself
        self.devices = devices
        self.config = config
    }


}


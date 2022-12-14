//
// Event.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Event: Codable {

    public var deviceId: String?
    public var type: String?
    public var timestamp: Date?
    public var payload: JSONValue?

    public init(deviceId: String?, type: String?, timestamp: Date?, payload: JSONValue?) {
        self.deviceId = deviceId
        self.type = type
        self.timestamp = timestamp
        self.payload = payload
    }


}


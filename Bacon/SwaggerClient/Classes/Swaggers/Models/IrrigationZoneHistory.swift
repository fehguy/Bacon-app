//
// IrrigationZoneHistory.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct IrrigationZoneHistory: Codable {

    public var zoneName: String?
    public var events: [IrrigationZoneEvent]?

    public init(zoneName: String?, events: [IrrigationZoneEvent]?) {
        self.zoneName = zoneName
        self.events = events
    }


}


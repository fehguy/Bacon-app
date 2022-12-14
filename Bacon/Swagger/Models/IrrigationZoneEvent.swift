//
// IrrigationZoneEvent.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct IrrigationZoneEvent: Codable {

    public var zoneName: String?
    public var startedAt: Date?
    public var endedAt: Date?
    public var durationInMs: Double?

    public init(zoneName: String?, startedAt: Date?, endedAt: Date?, durationInMs: Double?) {
        self.zoneName = zoneName
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.durationInMs = durationInMs
    }


}


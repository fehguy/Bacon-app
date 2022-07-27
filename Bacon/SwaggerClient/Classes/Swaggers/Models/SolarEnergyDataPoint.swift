//
// SolarEnergyDataPoint.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct SolarEnergyDataPoint: Codable {

    public var observationDate: Date?
    public var batteryLevel: Double?
    public var load: Double?
    public var solarGeneration: Double?
    public var batteryPower: Double?
    public var batteryExport: Double?
    public var batteryImport: Double?
    public var fromGrid: Double?
    public var toGrid: Double?
    public var gridPower: Double?
    public var solar: Double?

    public init(observationDate: Date?, batteryLevel: Double?, load: Double?, solarGeneration: Double?, batteryPower: Double?, batteryExport: Double?, batteryImport: Double?, fromGrid: Double?, toGrid: Double?, gridPower: Double?, solar: Double?) {
        self.observationDate = observationDate
        self.batteryLevel = batteryLevel
        self.load = load
        self.solarGeneration = solarGeneration
        self.batteryPower = batteryPower
        self.batteryExport = batteryExport
        self.batteryImport = batteryImport
        self.fromGrid = fromGrid
        self.toGrid = toGrid
        self.gridPower = gridPower
        self.solar = solar
    }


}

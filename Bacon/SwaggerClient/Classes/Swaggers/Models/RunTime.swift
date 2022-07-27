//
// RunTime.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Summary of time spent with irrigation on */

public struct RunTime: Codable {

    public var duration: Double?
    public var units: String?

    public init(duration: Double?, units: String?) {
        self.duration = duration
        self.units = units
    }


}

//
// DarkSkyConfiguration.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct DarkSkyConfiguration: Codable {

    public var host: String?
    public var apiKey: String?

    public init(host: String?, apiKey: String?) {
        self.host = host
        self.apiKey = apiKey
    }


}


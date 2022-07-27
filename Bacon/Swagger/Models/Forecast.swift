//
// Forecast.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class Forecast: JSONEncodable {

    public var date: Date?
    public var pressure: Double?
    public var humidity: Int32?
    public var windSpeed: Double?
    public var clouds: Int32?
    public var temperature: ForecastTemperature?
    public var weather: WeatherForecast?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["date"] = self.date?.encodeToJSON()
        nillableDictionary["pressure"] = self.pressure
        nillableDictionary["humidity"] = self.humidity?.encodeToJSON()
        nillableDictionary["windSpeed"] = self.windSpeed
        nillableDictionary["clouds"] = self.clouds?.encodeToJSON()
        nillableDictionary["temperature"] = self.temperature?.encodeToJSON()
        nillableDictionary["weather"] = self.weather?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}


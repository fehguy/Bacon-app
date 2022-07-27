//
// EnvironmentAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class EnvironmentAPI {
    /**
     Returns the state of a specific zone's heater
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getHeaterState(zoneId: String, completion: @escaping ((_ data: HeaterState?,_ error: Error?) -> Void)) {
        getHeaterStateWithRequestBuilder(zoneId: zoneId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Returns the state of a specific zone's heater
     - GET /temperature/{zoneId}/heater
     - Gets the state of the heater.  The `zoneId` specifies which heater to return data for and must be one of the designated `zoneId` values in the `/temperature` summary operation 
     - examples: [{contentType=application/json, example={"empty": false}}]
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 

     - returns: RequestBuilder<HeaterState> 
     */
    open class func getHeaterStateWithRequestBuilder(zoneId: String) -> RequestBuilder<HeaterState> {
        var path = "/temperature/{zoneId}/heater"
        let zoneIdPreEscape = "\(zoneId)"
        let zoneIdPostEscape = zoneIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{zoneId}", with: zoneIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<HeaterState>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Returns a specific zones' temperature
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getZoneTemperature(zoneId: String, completion: @escaping ((_ data: TemperatueZoneStatus?,_ error: Error?) -> Void)) {
        getZoneTemperatureWithRequestBuilder(zoneId: zoneId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Returns a specific zones' temperature
     - GET /temperature/{zoneId}
     - examples: [{contentType=application/json, example={"empty": false}}]
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 

     - returns: RequestBuilder<TemperatueZoneStatus> 
     */
    open class func getZoneTemperatureWithRequestBuilder(zoneId: String) -> RequestBuilder<TemperatueZoneStatus> {
        var path = "/temperature/{zoneId}"
        let zoneIdPreEscape = "\(zoneId)"
        let zoneIdPostEscape = zoneIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{zoneId}", with: zoneIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<TemperatueZoneStatus>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter units
     */
    public enum Units_getZoneTemperatureHistory: String { 
        case minutely = "minutely"
        case quarterhourly = "quarterHourly"
        case hourly = "hourly"
        case daily = "daily"
    }

    /**
     Returns a specific zones' temperature history
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter limit: (query)  (optional, default to 10)
     - parameter units: (query)  (optional, default to hourly)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getZoneTemperatureHistory(zoneId: String, limit: Int? = nil, units: Units_getZoneTemperatureHistory? = nil, completion: @escaping ((_ data: TemperatureZoneHistory?,_ error: Error?) -> Void)) {
        getZoneTemperatureHistoryWithRequestBuilder(zoneId: zoneId, limit: limit, units: units).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Returns a specific zones' temperature history
     - GET /temperature/{zoneId}/history
     - examples: [{contentType=application/json, example={"empty": false}}]
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter limit: (query)  (optional, default to 10)
     - parameter units: (query)  (optional, default to hourly)

     - returns: RequestBuilder<TemperatureZoneHistory> 
     */
    open class func getZoneTemperatureHistoryWithRequestBuilder(zoneId: String, limit: Int? = nil, units: Units_getZoneTemperatureHistory? = nil) -> RequestBuilder<TemperatureZoneHistory> {
        var path = "/temperature/{zoneId}/history"
        let zoneIdPreEscape = "\(zoneId)"
        let zoneIdPostEscape = zoneIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{zoneId}", with: zoneIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "limit": limit?.encodeToJSON(), 
            "units": units?.rawValue
        ])

        let requestBuilder: RequestBuilder<TemperatureZoneHistory>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func removeSetPoint(zoneId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        removeSetPointWithRequestBuilder(zoneId: zoneId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - DELETE /temperature/{zoneId}/setpoint
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 

     - returns: RequestBuilder<Void> 
     */
    open class func removeSetPointWithRequestBuilder(zoneId: String) -> RequestBuilder<Void> {
        var path = "/temperature/{zoneId}/setpoint"
        let zoneIdPreEscape = "\(zoneId)"
        let zoneIdPostEscape = zoneIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{zoneId}", with: zoneIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter format
     */
    public enum Format_sendHeaterDailySummary: String { 
        case text = "text"
        case html = "html"
    }

    /**

     - parameter emailAddress: (query) the recipient of the summary. If not present, the summary will be returned in the response only (optional)
     - parameter sendIfEmpty: (query) sends the summary even if there is no heater activity (optional, default to false)
     - parameter resetOnSend: (query) resets the daily counter if true (optional, default to false)
     - parameter format: (query) sets the format for the body (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func sendHeaterDailySummary(emailAddress: String? = nil, sendIfEmpty: Bool? = nil, resetOnSend: Bool? = nil, format: Format_sendHeaterDailySummary? = nil, completion: @escaping ((_ data: String?,_ error: Error?) -> Void)) {
        sendHeaterDailySummaryWithRequestBuilder(emailAddress: emailAddress, sendIfEmpty: sendIfEmpty, resetOnSend: resetOnSend, format: format).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - POST /temperature/summary
     - examples: [{output=none}]
     
     - parameter emailAddress: (query) the recipient of the summary. If not present, the summary will be returned in the response only (optional)
     - parameter sendIfEmpty: (query) sends the summary even if there is no heater activity (optional, default to false)
     - parameter resetOnSend: (query) resets the daily counter if true (optional, default to false)
     - parameter format: (query) sets the format for the body (optional)

     - returns: RequestBuilder<String> 
     */
    open class func sendHeaterDailySummaryWithRequestBuilder(emailAddress: String? = nil, sendIfEmpty: Bool? = nil, resetOnSend: Bool? = nil, format: Format_sendHeaterDailySummary? = nil) -> RequestBuilder<String> {
        let path = "/temperature/summary"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "emailAddress": emailAddress, 
            "sendIfEmpty": sendIfEmpty, 
            "resetOnSend": resetOnSend, 
            "format": format?.rawValue
        ])

        let requestBuilder: RequestBuilder<String>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter state
     */
    public enum State_setHeaterState: String { 
        case on = "on"
        case off = "off"
    }

    /**
     Turn a heater on or off
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter state: (path) The state to set the heater in the specified zone to 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setHeaterState(zoneId: String, state: State_setHeaterState, completion: @escaping ((_ data: ApiResponse2?,_ error: Error?) -> Void)) {
        setHeaterStateWithRequestBuilder(zoneId: zoneId, state: state).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Turn a heater on or off
     - POST /temperature/{zoneId}/heater/{state}
     - Sets a heater state to `on` or `off` depending on the `state` being passed.   
     - examples: [{contentType=application/json, example={}}]
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter state: (path) The state to set the heater in the specified zone to 

     - returns: RequestBuilder<ApiResponse2> 
     */
    open class func setHeaterStateWithRequestBuilder(zoneId: String, state: State_setHeaterState) -> RequestBuilder<ApiResponse2> {
        var path = "/temperature/{zoneId}/heater/{state}"
        let zoneIdPreEscape = "\(zoneId)"
        let zoneIdPostEscape = zoneIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{zoneId}", with: zoneIdPostEscape, options: .literal, range: nil)
        let statePreEscape = "\(state.rawValue)"
        let statePostEscape = statePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{state}", with: statePostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ApiResponse2>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter units
     */
    public enum Units_setHeaterZoneTimer: String { 
        case seconds = "seconds"
        case minutes = "minutes"
        case hours = "hours"
        case days = "days"
    }

    /**
     Turns a zone on or off for a specified duration
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter duration: (path) Duration to enable the heater for in the units specfied in the &#x60;units&#x60; argument  
     - parameter units: (query) The unit for the time supplied (optional, default to hours)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setHeaterZoneTimer(zoneId: String, duration: Int, units: Units_setHeaterZoneTimer? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        setHeaterZoneTimerWithRequestBuilder(zoneId: zoneId, duration: duration, units: units).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Turns a zone on or off for a specified duration
     - POST /temperature/{zoneId}/timer/{duration}
     - Enables a heater for a specified amount of time.  If the timer is  already running, it will turn off after the timer duration. 
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter duration: (path) Duration to enable the heater for in the units specfied in the &#x60;units&#x60; argument  
     - parameter units: (query) The unit for the time supplied (optional, default to hours)

     - returns: RequestBuilder<Void> 
     */
    open class func setHeaterZoneTimerWithRequestBuilder(zoneId: String, duration: Int, units: Units_setHeaterZoneTimer? = nil) -> RequestBuilder<Void> {
        var path = "/temperature/{zoneId}/timer/{duration}"
        let zoneIdPreEscape = "\(zoneId)"
        let zoneIdPostEscape = zoneIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{zoneId}", with: zoneIdPostEscape, options: .literal, range: nil)
        let durationPreEscape = "\(duration)"
        let durationPostEscape = durationPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{duration}", with: durationPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "units": units?.rawValue
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter temperature: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setSetPoint(zoneId: String, temperature: Double, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        setSetPointWithRequestBuilder(zoneId: zoneId, temperature: temperature).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - POST /temperature/{zoneId}/setpoint/{temperature}
     
     - parameter zoneId: (path) The zone identifier, for example &#x60;living-room&#x60; 
     - parameter temperature: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func setSetPointWithRequestBuilder(zoneId: String, temperature: Double) -> RequestBuilder<Void> {
        var path = "/temperature/{zoneId}/setpoint/{temperature}"
        let zoneIdPreEscape = "\(zoneId)"
        let zoneIdPostEscape = zoneIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{zoneId}", with: zoneIdPostEscape, options: .literal, range: nil)
        let temperaturePreEscape = "\(temperature)"
        let temperaturePostEscape = temperaturePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{temperature}", with: temperaturePostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Gets a summary of temparature information
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func temperatureSummary(completion: @escaping ((_ data: TemperatureSummary?,_ error: Error?) -> Void)) {
        temperatureSummaryWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Gets a summary of temparature information
     - GET /temperature
     - Returns an uncached, real-time summary of temparature in the system. `ZoneStatus` data is mapped to the `zones` objects.  If a zone status is not available, it will still be returned in the `zoneStatus` array but with empty data 
     - examples: [{contentType=application/json, example={"empty": false}}]

     - returns: RequestBuilder<TemperatureSummary> 
     */
    open class func temperatureSummaryWithRequestBuilder() -> RequestBuilder<TemperatureSummary> {
        let path = "/temperature"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<TemperatureSummary>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Gets an array of zones
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func temperatureZones(completion: @escaping ((_ data: [String]?,_ error: Error?) -> Void)) {
        temperatureZonesWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Gets an array of zones
     - GET /temperature/zones
     - Returns a list of all registered zoneIds
     - examples: [{contentType=application/json, example={}}]

     - returns: RequestBuilder<[String]> 
     */
    open class func temperatureZonesWithRequestBuilder() -> RequestBuilder<[String]> {
        let path = "/temperature/zones"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[String]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
//
// DeviceAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class DeviceAPI {
    /**
     * enum for parameter sort
     */
    public enum Sort_ambientLightSummary: String { 
        case asc = "asc"
        case desc = "desc"
    }

    /**
     * enum for parameter resolution
     */
    public enum Resolution_ambientLightSummary: String { 
        case minutes = "minutes"
        case quarterHours = "quarter-hours"
        case hours = "hours"
        case days = "days"
    }

    /**

     - parameter sort: (query)  (optional, default to desc)
     - parameter pastHours: (query) the number of hours, before now, to start at (optional)
     - parameter resolution: (query) the fidelity of the results (optional)
     - parameter limit: (query) the total number of points to return (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func ambientLightSummary(sort: Sort_ambientLightSummary? = nil, pastHours: Double? = nil, resolution: Resolution_ambientLightSummary? = nil, limit: Double? = nil, completion: @escaping ((_ data: [AmbientLightDataPoint]?,_ error: Error?) -> Void)) {
        ambientLightSummaryWithRequestBuilder(sort: sort, pastHours: pastHours, resolution: resolution, limit: limit).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /device/ambientLight
     - examples: [{contentType=application/json, example={}}]
     
     - parameter sort: (query)  (optional, default to desc)
     - parameter pastHours: (query) the number of hours, before now, to start at (optional)
     - parameter resolution: (query) the fidelity of the results (optional)
     - parameter limit: (query) the total number of points to return (optional)

     - returns: RequestBuilder<[AmbientLightDataPoint]> 
     */
    open class func ambientLightSummaryWithRequestBuilder(sort: Sort_ambientLightSummary? = nil, pastHours: Double? = nil, resolution: Resolution_ambientLightSummary? = nil, limit: Double? = nil) -> RequestBuilder<[AmbientLightDataPoint]> {
        let path = "/device/ambientLight"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "sort": sort?.rawValue, 
            "pastHours": pastHours, 
            "resolution": resolution?.rawValue, 
            "limit": limit
        ])

        let requestBuilder: RequestBuilder<[AmbientLightDataPoint]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Returns all devices in the system
     
     - parameter deviceType: (query) Supply a string or substring to match against &#x60;deviceType&#x60;, &#x60;device.id&#x60;, or &#x60;device.name&#x60; (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDevices(deviceType: String? = nil, completion: @escaping ((_ data: [Device]?,_ error: Error?) -> Void)) {
        getDevicesWithRequestBuilder(deviceType: deviceType).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Returns all devices in the system
     - GET /devices
     - Returns all registered devices.  Make this call to see what is in the system and use those addresses for connectivity.
     - examples: [{contentType=application/json, example={}}]
     
     - parameter deviceType: (query) Supply a string or substring to match against &#x60;deviceType&#x60;, &#x60;device.id&#x60;, or &#x60;device.name&#x60; (optional)

     - returns: RequestBuilder<[Device]> 
     */
    open class func getDevicesWithRequestBuilder(deviceType: String? = nil) -> RequestBuilder<[Device]> {
        let path = "/devices"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "deviceType": deviceType
        ])

        let requestBuilder: RequestBuilder<[Device]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     gets configured loggers
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getLoggers(completion: @escaping ((_ data: LoggersResponse?,_ error: Error?) -> Void)) {
        getLoggersWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     gets configured loggers
     - GET /device/logging
     - examples: [{contentType=application/json, example={"empty": false}}]

     - returns: RequestBuilder<LoggersResponse> 
     */
    open class func getLoggersWithRequestBuilder() -> RequestBuilder<LoggersResponse> {
        let path = "/device/logging"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<LoggersResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Sends a notification to one or many devices
     
     - parameter devices: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func notifyDevices(devices: [DeviceNotification], completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        notifyDevicesWithRequestBuilder(devices: devices).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     Sends a notification to one or many devices
     - POST /devices/notify
     - A notification is a semi-structure object which contains a `host` and payload.  The keyword `ALL` is reserved for sending a single notification to all registered devices in the network. 
     
     - parameter devices: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func notifyDevicesWithRequestBuilder(devices: [DeviceNotification]) -> RequestBuilder<Void> {
        let path = "/devices/notify"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: devices)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Registers a device
     
     - parameter device: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func registerDevice(device: DeviceRegistrationRequest, completion: @escaping ((_ data: ConfigurationInfo?,_ error: Error?) -> Void)) {
        registerDeviceWithRequestBuilder(device: device).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Registers a device
     - POST /devices/register
     - Devices are expected to periodically re-register with the controller.  If they do not report back, they will be purged from the network and become unavailable to clients.  There  is no harm in re-registering multiple times. 
     - examples: [{contentType=application/json, example={"empty": false}}]
     
     - parameter device: (body)  

     - returns: RequestBuilder<ConfigurationInfo> 
     */
    open class func registerDeviceWithRequestBuilder(device: DeviceRegistrationRequest) -> RequestBuilder<ConfigurationInfo> {
        let path = "/devices/register"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: device)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ConfigurationInfo>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter playerId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setDefaultZone(playerId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        setDefaultZoneWithRequestBuilder(playerId: playerId).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     - POST /sonos/{playerId}
     
     - parameter playerId: (path)  

     - returns: RequestBuilder<Void> 
     */
    open class func setDefaultZoneWithRequestBuilder(playerId: String) -> RequestBuilder<Void> {
        var path = "/sonos/{playerId}"
        let playerIdPreEscape = "\(playerId)"
        let playerIdPostEscape = playerIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{playerId}", with: playerIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     * enum for parameter level
     */
    public enum Level_setLogLevel: String { 
        case debug = "debug"
        case info = "info"
        case warn = "warn"
        case error = "error"
    }

    /**
     sets the log level
     
     - parameter level: (path)  
     - parameter logger: (query) an optional log name to configure. Leave empty to set all (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func setLogLevel(level: Level_setLogLevel, logger: String? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        setLogLevelWithRequestBuilder(level: level, logger: logger).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     sets the log level
     - POST /device/logging/{level}
     
     - parameter level: (path)  
     - parameter logger: (query) an optional log name to configure. Leave empty to set all (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func setLogLevelWithRequestBuilder(level: Level_setLogLevel, logger: String? = nil) -> RequestBuilder<Void> {
        var path = "/device/logging/{level}"
        let levelPreEscape = "\(level.rawValue)"
        let levelPostEscape = levelPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{level}", with: levelPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "logger": logger
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     updates the device
     
     - parameter delay: (query) specify a time delay, in minutes, before updating (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func updateDevice(delay: Int? = nil, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        updateDeviceWithRequestBuilder(delay: delay).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }


    /**
     updates the device
     - POST /device/update
     
     - parameter delay: (query) specify a time delay, in minutes, before updating (optional)

     - returns: RequestBuilder<Void> 
     */
    open class func updateDeviceWithRequestBuilder(delay: Int? = nil) -> RequestBuilder<Void> {
        let path = "/device/update"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "delay": delay?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
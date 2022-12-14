//
// SensorsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class SensorsAPI {
    /**

     - parameter sensorId: (path)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSensor(sensorId: String, completion: @escaping ((_ data: SensorStatus?,_ error: Error?) -> Void)) {
        getSensorWithRequestBuilder(sensorId: sensorId).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /sensors/{sensorId}
     - examples: [{contentType=application/json, example={
  "bytes": [],
  "empty": true
}}]
     
     - parameter sensorId: (path)  

     - returns: RequestBuilder<SensorStatus> 
     */
    open class func getSensorWithRequestBuilder(sensorId: String) -> RequestBuilder<SensorStatus> {
        var path = "/sensors/{sensorId}"
        let sensorIdPreEscape = "\(sensorId)"
        let sensorIdPostEscape = sensorIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{sensorId}", with: sensorIdPostEscape, options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<SensorStatus>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**

     - parameter zone: (query) Filters sensors to a particular zone (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getSensors(zone: String? = nil, completion: @escaping ((_ data: [SensorStatus]?,_ error: Error?) -> Void)) {
        getSensorsWithRequestBuilder(zone: zone).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     - GET /sensors
     - examples: [{contentType=application/json, example={}}]
     
     - parameter zone: (query) Filters sensors to a particular zone (optional)

     - returns: RequestBuilder<[SensorStatus]> 
     */
    open class func getSensorsWithRequestBuilder(zone: String? = nil) -> RequestBuilder<[SensorStatus]> {
        let path = "/sensors"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "zone": zone
        ])

        let requestBuilder: RequestBuilder<[SensorStatus]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}

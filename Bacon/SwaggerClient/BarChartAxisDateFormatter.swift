//
//  BarChartAxisDateFormatter.swift
//  Bacon
//
//  Created by Tony Tam on 1/6/22.
//

import Foundation
import Charts

public class BarChartAxisDateFormatter: NSObject, IAxisValueFormatter{
    let dateFormatter = DateFormatter()

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let date = Date(timeIntervalSinceNow: value * 1000.0)
        dateFormatter.dateFormat = "M/d/YY"
        return dateFormatter.string(from: date)
    }
}

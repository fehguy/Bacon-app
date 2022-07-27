//
//  HeatingView.swift
//  Bacon
//
//  Created by Tony Tam on 12/17/21.
//


import SwiftUI
import Charts

struct LineChartValue: Identifiable {
    let x: Double
    let y: Double
    let id = UUID()
}

struct HeatingView: View {
    let name: String
    let timer = Timer.publish(every: 5, on: .current, in: .common).autoconnect()
    @State var heatingStatus:[HeatingStatus] = []
    @State var lineChartSource: String?

    init(name: String) {
        self.name = name
    }

    var body: some View {
        Spacer() 
        List($heatingStatus) {heater in
            VStack (alignment: .leading) {
                HeaterView(heater: heater)
                    .onTapGesture {
                        lineChartSource = heater.id
                    }
            }
        }
        LineChart(name: $lineChartSource)
        Spacer()
            .onReceive(timer) { input in
                refreshHeaters()
            }
            .onAppear {
                refreshHeaters()
            }
    }
    
    func refreshHeaters() {
        EnvironmentAPI.temperatureSummary { data, error in
            if let data = data {
                self.heatingStatus.removeAll()
                let sorted = data.zones?.sorted(by: { t1, t2 in
                    return t1.name < t2.name
                })
                sorted?.forEach({ temperatureZone in
                    if let zoneStatus = data.zoneStatus?.filter({ status in
                        status.name == temperatureZone.name && (temperatureZone.zone == self.name || self.name == "")
                    }).first {
                        let isOn: Bool
                        if  zoneStatus.heater == TemperatueZoneStatus.Heater.on {
                            isOn = true
                        }
                        else {
                            isOn = false
                        }
                        self.heatingStatus.append(HeatingStatus(id: zoneStatus._id,
                                                                name: temperatureZone.name,
                                                                isOn: isOn,
                                                                value: zoneStatus.value ?? 0.0,
                                                                status: zoneStatus))
                    
                    }
                })
            }
        }
    }
}

struct HeaterView: View {
    @Binding var heater: HeatingStatus
    
    var body: some View {
        HStack {
            Text("\(heater.name)")
            Spacer(minLength: 25)
            Text("\(String(format: "%.6f", heater.value))")
            LabeledCheckbox(labelText: heater.id,
                            isChecked: $heater.isOn )
        }
    }
}

struct FakeData : Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

struct LineChart:View {
    @State var chartData: [LineChartValue] = []
    @State var setPointData = []
    @State var markers = []
    @State var units: EnvironmentAPI.Units_getZoneTemperatureHistory = EnvironmentAPI.Units_getZoneTemperatureHistory.hourly
    @State var limit: Int = 200
    let timer = Timer.publish(every: 5, on: .current, in: .common).autoconnect()
    @Binding var name: String?
    
    var data: [FakeData] = [
        .init(type: "Cube", count: 5),
        .init(type: "Sphere", count: 4),
        .init(type: "Pyramid", count: 4)
    ]

    var body: some View {
        Text(name ?? "select a room")
        VStack{
            HStack {
                Button("-") {
                    self.limit = self.limit - 20
                    if self.limit < 48 {
                        self.limit = 48
                    }
                    refreshData()
                }
                Button("days") {
                    self.units = EnvironmentAPI.Units_getZoneTemperatureHistory.daily
                    refreshData()
                }
                Button("hours") {
                    self.units = EnvironmentAPI.Units_getZoneTemperatureHistory.hourly
                    refreshData()
                }
                Button("15 min") {
                    self.units = EnvironmentAPI.Units_getZoneTemperatureHistory.quarterhourly
                    refreshData()
                }
                Button("minutes") {
                    self.units = EnvironmentAPI.Units_getZoneTemperatureHistory.minutely
                    refreshData()
                }
                Button("+") {
                    self.limit = self.limit + 20
                    refreshData()
                }
            }
            Chart(chartData) {
                LineMark(
                    x: .value("Shape Type", $0.x),
                    y: .value("Total Count", $0.y)
                )
            }
//            LineChartUIView(entries: chartData, setPoints: setPointData, markers: markers, name: self.name)
        }
        .onChange(of: name, perform: { value in
            refreshData()
        })
        .onReceive(timer) { input in
            refreshData()
        }
        .onAppear {
            refreshData()
        }
    }
    
    func refreshData() {
        guard let name = name else {
            return
        }
        EnvironmentAPI.getZoneTemperatureHistory(zoneId: name, limit: limit, units: units) { history, error in
            if let history = history {
                chartData.removeAll()
                setPointData.removeAll()
                markers.removeAll()
                history.values?.forEach({ item in
                    let date = item.timestamp!.timeIntervalSinceNow / 1000.0
                    let temperature = item.temperature ?? 0.0
                    
//                    let markerColor: NSUIColor
                    if item.heater == TemperatureZoneHistoryItem.Heater.on {
//                        markerColor = NSUIColor.red
                    }
                    else {
//                        markerColor = NSUIColor.clear
                    }
                    chartData.append(LineChartValue(x: date, y: temperature))
                    
                    if let setpoint = item.setPoint {
//                        setPointData.append(ChartDataEntry(x: date, y: setpoint))
                    }
                    
//                    markers.append(markerColor)
                })
            }
        }
    }
}

struct HeaterControlView: View {
    @State var id: String
    @State var name: String
    @State var value: Double
    @State var isOn: Bool

    var body: some View {
        Text("\(name)")
        Spacer(minLength: 25)
        Text("\(String(format: "%.2f", value))")
        LabeledCheckbox(labelText: id,
                        isChecked: $isOn )
    }
}

struct LabeledCheckbox: View {
    var labelText: String
    @Binding var isChecked: Bool

    var checkBox: Image {
        Image(systemName: isChecked ? "checkmark.circle" : "circle")
    }

    var body: some View {
        Button(action: {
            self.isChecked.toggle()
            let temperature: Double
            if self.isChecked {
                temperature = 75.0
            }
            else {
                temperature = 50.0
            }
            
            EnvironmentAPI.setSetPoint(zoneId: self.labelText, temperature: temperature) { data, error in
                print("set \(self.labelText) to \(temperature)")
            }
        })
        {
            HStack {
                checkBox
            }
        }
    }
}

struct HeatingStatus: Identifiable {
    let id: String
    var name: String
    var isOn: Bool
    var value: Double
    var status: TemperatueZoneStatus
}

//
//  LightsView.swift
//  Bacon
//
//  Created by Tony Tam on 12/5/21.
//

import SwiftUI
import Moog


struct LightsView: View {
    let name: String
    @State var lights = SystemState.shared().lights
    @State var watchedNode: ObjectNode?
    
    init(name: String) {
        self.name = name
        var moog = Moog.shared()
        self.watchedNode = moog.itemAtPath("foo.bar") as? ObjectNode
    }
    
    var body: some View {
        List {
            ForEach(self.lights) { light in
                if light.type == LightingZone.DeviceType._switch {
                    showSwitchView(light)
                }
                else if light.type == LightingZone.DeviceType.dimmer {
                    showDimmerView(light)
                }
            }
            Rectangle().fill(Color.gray).opacity(0.4).frame(width: CGFloat(1))
        }
        .onAppear {
            PLights().lightsForZone(zone: self.name) {(lights) -> () in
                self.lights = lights
            }
        }
    }
    
    func showSwitchView(_ light: Light) -> some View {
        var position = -1
        for i in 0 ..< self.lights.count {
            let l = self.lights[i]
            if l.id == light.id {
                position = i
            }
        }
        return VStack {
            HStack {
                Text("\(light.name)")
                Spacer()
                Toggle("", isOn: self.$lights[position].state)
                    .onChange(of: self.lights[position].state) { value in
                        let switchState: ZWaveAPI.Value_setSwitch
                        if value == true {
                            switchState = ZWaveAPI.Value_setSwitch.on
                        }
                        else {
                            switchState = ZWaveAPI.Value_setSwitch.off
                        }
                        ZWaveAPI.setSwitch(deviceId: light.id, value: switchState) { data, error in
                            print(data, error)
                        }
                    }
            }
        }.frame(maxWidth: .infinity)
    }
    
    func showDimmerView(_ light: Light) -> some View {
        var position = -1
        for i in 0 ..< self.lights.count {
            let l = self.lights[i]
            if l.id == light.id {
                position = i
            }
        }
        
        return VStack {
            HStack {
                Text("\(light.name)")
                Spacer()
                Slider(
                    value: self.$lights[position].level,
                    in: 0...100
                    )
                    .frame(maxWidth: 200)
                }
                .onChange(of: self.lights[position].level) { value in
                    ZWaveAPI.setDimmer(deviceId: light.id, value: Int(value) ) { data, error in
                        print(data, error)
                    }
                }
        }
    }
}

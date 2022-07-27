//
//  SystemState.swift
//  Bacon
//
//  Created by Tony Tam on 12/16/21.
//

import Foundation
import SwiftUI


class SystemState {
    static let STATE = SystemState()
    var counter: Int = 0
    var testing: String?

    static func shared() -> SystemState {
        STATE.counter = STATE.counter + 1
        return STATE
    }
    
    @State var lights = [Light]()
}

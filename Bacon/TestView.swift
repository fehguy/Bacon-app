//
//  TestView.swift
//  Bacon
//
//  Created by Tony Tam on 12/24/21.
//

import SwiftUI
import Moog

extension ObjectNode: Equatable {
    public static func == (lhs: ObjectNode, rhs: ObjectNode) -> Bool {
        return lhs.isEqualTo(rhs: rhs)
    }
}

extension ValueNode: Equatable {
    public static func == (lhs: ValueNode, rhs: ValueNode) -> Bool {
        return lhs.isEqualTo(rhs: rhs)
    }
}

struct TestView: View {
    @State var watchedNode: ObjectNode?
    @State var watchedValue:[String: String] = ["Fun":"True"]
    @State var myValue = ValueNode("fun")
    @State var name: String? = "living-room"
    var moog = Moog.shared()

    init(name: String) {
        self.watchedNode = moog.itemAtPath("foo.bar", create: true) as? ObjectNode
    }
    
    var body: some View {
        LineChart(name: $name)
        Text("hello!!!")
            .onChange(of: self.watchedValue) { newValue in
                print("changed")
            }
            .onChange(of: self.myValue) { newValue in
                print("more change")
            }
        Button("Click me") {
            Sender().send()
            watchedValue["foo"] = "Bar"
            myValue.setValue(Int.random(in: 0...100))
        }
    }
}

class Sender {
    func send() {
        var moog = Moog.shared()
            
        let path = "foo.bar.baz\(Int.random(in: 0 ... 100))"
        moog.addItem(path: path, item: ValueNode(Int.random(in: 0 ... 100)))
        
        let on = moog.itemAtPath("foo.bar") as? ObjectNode
        print(on?.getValues().count)
    }
}

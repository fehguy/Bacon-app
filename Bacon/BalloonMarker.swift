//
//  BalloonMarker.swift
//  Bacon
//
//  Created by Tony Tam on 1/11/22.
//

import Foundation
import Charts
import CoreGraphics
#if canImport(AppKit)
import AppKit
#endif

class CustomMarker: MarkerView {
    override func draw(context: CGContext, point: CGPoint)
    {
        let offset = self.offsetForDrawing(atPoint: point)
        
        context.saveGState()
        context.translateBy(x: point.x + offset.x,
                              y: point.y + offset.y)
//        NSUIGraphicsPushContext(context)
//        self.nsuiLayer?.render(in: context)
//        NSUIGraphicsPopContext()
        context.restoreGState()
    }
}

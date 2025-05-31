//
//  LineChartView.swift
//  habit tracker
//
//  Created by Emmanuel Pena on 5/31/25.
//
import UIKit

class LineChartView: UIView {
    
    var dataPoints: [CGFloat] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard dataPoints.count > 1 else { return }
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.clear(rect)
        
        let path = UIBezierPath()
        
        let maxData = dataPoints.max() ?? 1
        let height = bounds.height
        let width = bounds.width
        let spacing = width / CGFloat(dataPoints.count - 1)
        
        for (i, value) in dataPoints.enumerated() {
            let x = CGFloat(i) * spacing
            let y = height - (value / maxData * height)
            
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        path.lineWidth = 2
        UIColor.systemBlue.setStroke()
        path.stroke()
    }
}

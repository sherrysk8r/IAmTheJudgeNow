//
//  GraphComponentsViewController.swift
//  LetMeBeTheJudge
//
//  Created by Sherry Chen on 12/9/15.
//  Copyright (c) 2015 67442. All rights reserved.
//

import UIKit
import SwiftCharts

class GraphComponentsViewController: UIViewController {
    private var chart: Chart? // arc
    
    private var gradientPicker: GradientPicker? // to pick the colors of the bars
    
    var programScore: ProgramScore?
    
    override func viewDidLoad() {
        self.title = "Component Scores"
        
        gradientPicker = GradientPicker(width: 200)
        var makeVals: [(title: String, val: CGFloat)] = []
        
        var componentScores = programScore!.componentScores.scores
        for i in ComponentType.allValues {
            makeVals.append((title: i.rawValue, val: CGFloat(componentScores[i]!)))
        }
        
            
        let vals: [(title: String, val: CGFloat)] = makeVals
        
        let (minVal, maxVal): (CGFloat, CGFloat) = vals.reduce((min: CGFloat(0), max: CGFloat(0))) {tuple, val in
            (min: min(tuple.min, val.val), max: max(tuple.max, val.val))
        }
        let length: CGFloat = maxVal - minVal
        
        let zero = ChartAxisValueFloat(0)
        let bars: [ChartBarModel] = map(enumerate(vals)) {index, tuple in
            let percentage = (tuple.val - minVal - 0.01) / length // FIXME without -0.01 bar with 1 (100 perc) is black
            let color = self.gradientPicker!.colorForPercentage(percentage).colorWithAlphaComponent(0.6)
            return ChartBarModel(constant: ChartAxisValueFloat(CGFloat(index)), axisValue1: zero, axisValue2: ChartAxisValueFloat(tuple.val), bgColor: color)
        }
        
        let labelSettings = ChartLabelSettings(font: SwiftChartDefaults.labelFont)
        
        let xValues = map(stride(from: 0, through: 10, by: 1)) {ChartAxisValueFloat(CGFloat($0), labelSettings: labelSettings)}
        let yValues =
        [ChartAxisValueString(order: -1)] +
            map(enumerate(vals)) {index, tuple in ChartAxisValueString(tuple.0, order: index, labelSettings: labelSettings)} +
            [ChartAxisValueString(order: vals.count)]
        
        let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "Unfactored Score", settings: labelSettings))
        let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "Component", settings: labelSettings.defaultVertical()))
        
        let chartFrame = SwiftChartDefaults.chartFrame(self.view.bounds)
        
        // calculate coords space in the background to keep UI smooth
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            
            let coordsSpace = ChartCoordsSpaceLeftTopSingleAxis(chartSettings: SwiftChartDefaults.chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
            
            dispatch_async(dispatch_get_main_queue()) {
                
                let (xAxis, yAxis, innerFrame) = (coordsSpace.xAxis, coordsSpace.yAxis, coordsSpace.chartInnerFrame)
                
                let barsLayer = ChartBarsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, bars: bars, horizontal: true, barWidth: Env.iPad ? 40 : 16, animDuration: 0.5)
                
                let settings = ChartGuideLinesLayerSettings(linesColor: UIColor.blackColor(), linesWidth: SwiftChartDefaults.guidelinesWidth)
                let guidelinesLayer = ChartGuideLinesLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, axis: .X, settings: settings)
                
                // create x zero guideline as view to be in front of the bars
                let dummyZeroXChartPoint = ChartPoint(x: ChartAxisValueFloat(0), y: ChartAxisValueFloat(0))
                let xZeroGuidelineLayer = ChartPointsViewsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, chartPoints: [dummyZeroXChartPoint], viewGenerator: {(chartPointModel, layer, chart) -> UIView? in
                    let width: CGFloat = 2
                    let v = UIView(frame: CGRectMake(chartPointModel.screenLoc.x - width / 2, innerFrame.origin.y, width, innerFrame.size.height))
                    v.backgroundColor = UIColor(red: 1, green: 69 / 255, blue: 0, alpha: 1)
                    return v
                })
                
                let chart = Chart(
                    frame: chartFrame,
                    layers: [
                        xAxis,
                        yAxis,
                        guidelinesLayer,
                        barsLayer,
                        xZeroGuidelineLayer
                    ]
                )
                
                self.view.addSubview(chart.view)
                self.chart = chart
            }
        }
    }
    
    private class GradientPicker {
        
        let gradientImg: UIImage
        
        lazy var imgData: UnsafePointer<UInt8> = {
            let provider = CGImageGetDataProvider(self.gradientImg.CGImage)
            let pixelData = CGDataProviderCopyData(provider)
            return CFDataGetBytePtr(pixelData)
            }()
        
        init(width: CGFloat) {
            
            let gradient: CAGradientLayer = CAGradientLayer()
            gradient.frame = CGRectMake(0, 0, width, 1)
            gradient.colors = [UIColor.redColor().CGColor, UIColor.yellowColor().CGColor, UIColor.cyanColor().CGColor, UIColor.blueColor().CGColor]
            gradient.startPoint = CGPointMake(0, 0.5)
            gradient.endPoint = CGPointMake(1.0, 0.5)
            
            let imgHeight: Int = 1
            let imgWidth: Int = Int(gradient.bounds.size.width)
            
            let bitmapBytesPerRow: Int = imgWidth * 4
            
            let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
            let bitmapInfo: CGBitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue)

            let context = CGBitmapContextCreate(nil, imgWidth,
                imgHeight,
                8,
                bitmapBytesPerRow,
                colorSpace,
                bitmapInfo)
            
            UIGraphicsBeginImageContext(gradient.bounds.size)
            gradient.renderInContext(context!)
            
            let gradientImg = UIImage(CGImage: CGBitmapContextCreateImage(context)!)
            
            UIGraphicsEndImageContext()
            self.gradientImg = gradientImg!
        }
        
        func colorForPercentage(percentage: CGFloat) -> UIColor {
            
            let data = self.imgData
            
            let xNotRounded = self.gradientImg.size.width * percentage
            let x = 4 * (floor(abs(xNotRounded / 4)))
            let pixelIndex = Int(x * 4)
            
            let color = UIColor(
                red: CGFloat(data[pixelIndex + 0]) / 255.0,
                green: CGFloat(data[pixelIndex + 1]) / 255.0,
                blue: CGFloat(data[pixelIndex + 2]) / 255.0,
                alpha: CGFloat(data[pixelIndex + 3]) / 255.0
            )
            return color
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

}

//
//  CalculatePlotData.swift
//  SwiftUICorePlotExample
//
//  Created by Jeff Terry on 12/22/20.
//

import Foundation
import SwiftUI
import CorePlot

class CalculatePlotData: ObservableObject {
    
    var plotDataModel: PlotDataClass? = nil
    

    func plotYEqualsX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
        plotDataModel!.changingPlotParameters.yMin = -5.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -5.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .red()
        plotDataModel!.changingPlotParameters.title = " y = x"
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        for i in 0 ..< 120 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = x


            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        
    }
    
    
    func ploteToTheMinusX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y = exp(-x)"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "exp(-x)"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        for i in 0 ..< 60 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = exp(-x)
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    func plotError(UserDefined: String)
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
        plotDataModel!.changingPlotParameters.yMin = -1.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -1.0
        plotDataModel!.changingPlotParameters.xLabel = "n"
        plotDataModel!.changingPlotParameters.yLabel = "Relative Error"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "S1 & S3 Error"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        print("number of user iterations: ", UserDefined)
        print("x,     y,         sum1,      sum3,          sum2")
       
        var sum1Total = Float(0.0)
        var sum3Total = Float(0.0)
        var sum2Total = Float(0.0)
        
        var sum1TotalArray = [Float(0.0)]
        
        var UserDefinedIteration = Int(UserDefined)
        
        
        for m in 1 ... 2*UserDefinedIteration! {
            
            let sum1 =  pow(Float(-1.0),Float(m)) * (Float(m)) / (Float(m) + Float(1.0))
            
            sum1Total = sum1Total + sum1
            if m % 2 == 0 {
                sum1TotalArray.append(sum1Total)
            }
            
        }
        
        for n in 1 ... UserDefinedIteration! {

            //create x values here
            
            let x = Float(n)

            
            
            let sum2 = -((Float(2.0) * Float(n) - Float(1.0) ) / (Float(2.0) * Float(n))) + ((Float(2.0) * Float(n)) / (Float(2.0) * Float(n) + Float(1.0)))
            
        //create y values here

            //let WeirdMinus = (-2.0 * c) / (b - sqrt(pow(b,2.0) - 4.0 * a * c))
            
            
            
            //let NormMinus = ( -b - sqrt(pow(b,2.0) - 4 * a * c)) / ( 2 * a )
            let sum3  = Float(1.0) / ((Float(2.0) * Float(n)) * (Float(2.0) * Float(n) + Float(1.0)))
            //
            
            sum3Total = sum3Total + sum3
            
            sum2Total = sum2Total + sum2
            
            let y = Float(100)*abs(sum3Total - sum1TotalArray[n])/sum3Total
            print(x,"   ", y, sum1TotalArray[n], sum3Total, sum2Total)
            let dataPoint: plotDataType = [.X: log(Double(x)), .Y: log(Double(y))]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    
}




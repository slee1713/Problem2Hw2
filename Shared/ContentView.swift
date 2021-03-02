//
//  ContentView.swift
//  Shared
//
//  Created by Spencer Lee on 2/26/21.
//
import SwiftUI
import CorePlot

typealias plotDataType = [CPTScatterPlotField : Double]

struct ContentView: View {
    @EnvironmentObject var plotDataModel :PlotDataClass
    @ObservedObject private var calculator = CalculatePlotData()
    @State var isChecked:Bool = false
    @State var tempInput = "10"
  
    

    var body: some View {
        
        VStack{
      
            CorePlot(dataForPlot: $plotDataModel.plotData, changingPlotParameters: $plotDataModel.changingPlotParameters)
                .setPlotPadding(left: 10)
                .setPlotPadding(right: 10)
                .setPlotPadding(top: 10)
                .setPlotPadding(bottom: 10)
                .padding()
            
            Divider()
            
            HStack{
                
                HStack(alignment: .center) {
                    Text("User Defined Iterations: ")
                        .font(.callout)
                        .bold()
                    TextField("10", text: $tempInput)
                        .padding()
                }.padding()
                
//                Toggle(isOn: $isChecked) {
//                            Text("Display Error")
//                        }
//                .padding()
                
                
            }
            
            
            HStack{
                Button("calcualte", action: {self.calculate()} )
                .padding()
                
            }
            
        }
        
    }
    
    
    
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate(){
        
        //let UserIteration = $tempInput
        
        //pass the plotDataModel to the cosCalculator
        calculator.plotDataModel = self.plotDataModel
        
        //Calculate the new plotting data and place in the plotDataModel
        calculator.plotError(UserDefined: tempInput)
        
        
    }
    

   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

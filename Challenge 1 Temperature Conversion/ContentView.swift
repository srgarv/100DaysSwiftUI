//
//  ContentView.swift
//  Challenge 1 Temperature Conversion
//
//  Created by Scott Garvey on 7/10/20.
//  Copyright © 2020 Scott Garvey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
      @State private var inputDegrees = ""
      @State private var inputUnit = 0
      @State private var outputUnit = 0
    
     let tempFormats = ["Kelvin", "Celsius", "Fahrenheit"]
    
    var convertedTemp: Measurement<UnitTemperature> {
        let doubleInput = Double(inputDegrees) ?? 0
      
        switch inputUnit{
        case 0:
             return Measurement(value:doubleInput, unit:UnitTemperature.kelvin)
        case 1:
            return Measurement(value:doubleInput, unit:UnitTemperature.celsius)
        case 2:
              return Measurement(value:doubleInput, unit:UnitTemperature.fahrenheit)
        default:
             return Measurement(value:0, unit:UnitTemperature.kelvin)
            
        }
       
    }
    
    var outputTemp:Measurement<UnitTemperature>{
        
        switch outputUnit{
            case 0:
              return convertedTemp.converted(to: .kelvin)
            case 1:
                 return convertedTemp.converted(to: .celsius)
            case 2:
                 return convertedTemp.converted(to: .fahrenheit)
            default:
                 return  Measurement(value:0, unit:UnitTemperature.kelvin)
            
        }
        
    }
    
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Input Degrees")) {
                    TextField("Amount", text: $inputDegrees)
                        .keyboardType(.decimalPad)
                
               // Section(header: Text("What is your input format")) {
                        Picker("Input Format", selection: $inputUnit) {
                            ForEach(0 ..< tempFormats.count) {
                                Text("\(self.tempFormats[$0])")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                   // }
                }
                
                Section(header: Text("Output Degrees")) {
                    
                    Picker("Output Format", selection: $outputUnit) {
                        ForEach(0 ..< tempFormats.count) {
                            Text("\(self.tempFormats[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(outputTemp.value)")
                  
                 
                // Section(header: Text("What is your input format")) {
                         
                    // }
                 }
                    
                    
                 .navigationBarTitle("Temp Conversion")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

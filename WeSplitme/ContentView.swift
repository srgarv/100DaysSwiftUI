//
//  ContentView.swift
//  WeSplitme
//
//  Created by Scott Garvey on 7/9/20.
//  Copyright © 2020 Scott Garvey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        if amountPerPerson>0{
        return amountPerPerson
        }
        else { return 0}
    }
    var theGrandTotal: Double {
        let subTotal = Double(checkAmount) ?? 0
         let tipSelection = Double(tipPercentages[tipPercentage])
         let tipValue = subTotal / 100 * tipSelection
        let theTotal = subTotal + tipValue
        return theTotal
        
    }
   
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Check amount")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Number of People")) {
                TextField("How many People?", text: $numberOfPeople)
                    .keyboardType(.decimalPad)
                }
                // old picker
             /*  Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                    Text("\($0) people")
                    }
                }*/
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(0 ..< tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                Section(header: Text("Amount Per Person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Grand Total")){
                    Text("$\(theGrandTotal, specifier: "%.2f")")
                        .background(tipPercentage == 4 ? Color.red : Color.white)
                }
                    
                .navigationBarTitle("WeSplit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

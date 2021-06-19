//
//  ContentView.swift
//  ConvertVolume
//
//  Created by Theo Vora on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var fromUnit = 1
    @State private var toUnit = 0
    @State private var fromQuantity = "1"
    @State private var toQuantity = "1000"
    
    let units = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    var body: some View {
        Form {
            Section(header: Text("Take this")) {
                TextField("Quantity", text: $fromQuantity)
                Picker("Unit", selection: $fromUnit) {
                    ForEach(0 ..< units.count) {
                        Text("\(units[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Convert to")) {
                Picker("Unit", selection: $toUnit) {
                    ForEach(0 ..< units.count) {
                        Text("\(units[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                Text("\(toQuantity)")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

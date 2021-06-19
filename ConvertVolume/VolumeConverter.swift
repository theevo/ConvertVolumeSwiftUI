//
//  VolumeConverter.swift
//  ConvertVolume
//
//  Created by Theo Vora on 6/18/21.
//

import Foundation

let VolumeDictionary: [String: UnitVolume] = [
    "milliliters": UnitVolume.milliliters,
    "liters": UnitVolume.liters,
    "cups": UnitVolume.cups,
    "pints": UnitVolume.pints,
    "gallons": UnitVolume.gallons
]

struct VolumeConverter {
    let inputQuantity: Double
    let inputUnit: UnitVolume
    let outputUnit: UnitVolume
    
    init?(inputQuantity: String, inUnit: String, outUnit: String) {
        guard let inputQuantity = Double(inputQuantity),
              let inputUnit = VolumeDictionary[inUnit],
              let outputUnit = VolumeDictionary[outUnit] else { return nil }
        
        self.inputQuantity = inputQuantity
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}

extension VolumeConverter {
    var outputQuantity: String {
        let input = Measurement(value: inputQuantity, unit: inputUnit)
        let converted = input.converted(to: outputUnit)
        
        return "\(converted.value)"
    }
}

//
//  ContentView.swift
//  UnitConverterChallengeDay19
//
//  Created by Navjot Singh on 2020-02-20.
//  Copyright © 2020 Navjot Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let CONST_EMPTY_VALUE = ""
    @State private var lengthInputSelection = 1
    @State private var lengthOutputSelection = 1
    @State private var inputUnitAmount = ""
    let lengthsArrayOutput = ["meters", "kilometers", "feet", "yards", "miles"]
    let lengthsArrayInput = ["meters", "kilometers", "feet", "yards", "miles"]
    var result: String {
        var returnValue = CONST_EMPTY_VALUE
        var inputUnits: Measurement<UnitLength>
        let selectedInput = String(lengthsArrayInput[lengthInputSelection])
        let selectedOutPut = String(lengthsArrayOutput[lengthOutputSelection])
        print("Selected input\(selectedInput)")
        print("Selected output\(selectedOutPut)")
        //process input selection
        //if successful user input converted to Double then proceed next
        if let input = Double(inputUnitAmount) {
            switch selectedInput {
            case "meters":
                inputUnits = Measurement(value: input, unit: UnitLength.meters)
                break
            case "kilometers":
                inputUnits = Measurement(value: input, unit: UnitLength.kilometers)
                break
            case "feet":
                inputUnits = Measurement(value: input, unit: UnitLength.feet)
                break
            case "yards":
                inputUnits = Measurement(value: input, unit: UnitLength.yards)
                break
            case "miles":
                inputUnits = Measurement(value: input, unit: UnitLength.miles)
                break
            default:
                inputUnits = Measurement(value: input, unit: UnitLength.furlongs)
            }

            print("inputamopunt\(inputUnits)")

            //process the selected output format and process the input and show the results back to user
            var o: Measurement<UnitLength>
            switch selectedOutPut {
            case "meters":
                o = inputUnits.converted(to: UnitLength.meters)
                break
            case "kilometers":
                o = inputUnits.converted(to: UnitLength.kilometers)
                break
            case "feet":
                o = inputUnits.converted(to: UnitLength.feet)
                break
            case "yards":
                o = inputUnits.converted(to: UnitLength.yards)
                break
            case "miles":
                o = inputUnits.converted(to: UnitLength.miles)
                break
            default:
                o = inputUnits.converted(to: UnitLength.furlongs)
                break
            }
            print("Output vale \(o)")
            //format the final result to show at-most 2 fraction digits...
            let n = NumberFormatter()
            n.maximumFractionDigits = 2
            let m = MeasurementFormatter()
            m.numberFormatter = n
            //convert data to string for UI representation
            returnValue = String(format: "%.2f", o.value)
            print("return values: \(returnValue)")
        }
        return returnValue
    }


    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("Select inital conversion unit")) {
                    Picker("Select length type", selection: $lengthInputSelection) {
                        ForEach(0..<lengthsArrayInput.count) {
                            Text("\(self.lengthsArrayInput[$0])")
                        }
                    }
                            .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Select conversion unit")) {
                    Picker("Select length type", selection: $lengthOutputSelection) {
                        ForEach(0..<lengthsArrayOutput.count) {
                            Text("\(self.lengthsArrayOutput[$0])")
                        }
                    }
                            .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Enter conversion unit amount:")) {
                    TextField("Enter num of units: ", text: $inputUnitAmount)
                            .keyboardType(.decimalPad)
                }

                Section {
                    Text("Converted value is:\(result)")
                }
            }
                    .navigationBarTitle("UnitConverter")
        }
    }
}

func processInput() {

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

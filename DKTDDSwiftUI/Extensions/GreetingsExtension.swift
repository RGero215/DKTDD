//
//  GreetingsExtension.swift
//  DKTDDSwiftUI
//
//  Created by Ramon Geronimo on 10/2/22.
//

import Foundation

extension Greetings {
    // MARK: Helpers
    /// This helper function helps when array of names has two values and properly format the result. Ex: ["Jon", "Peter"] -> "Jon, and Peter"
    /// It also checks if the array input has a value that has a string with two names separated with comma. Ex: ["Jon, Peter", "Cris"]
    /// - Parameters:
    ///   - names: String array containing two names
    ///   - result: Names formatted string
    func handleNamesCountEqualsTwo(_ names: inout [String], _ result: inout String) {
        if names[0].contains(",") {
            let newNames = names[0].components(separatedBy: ", ")
            result += "\(newNames[0]), \(newNames[1]), and \(names[1])"
        } else if names[1].contains(","){
            let newNames = names[1].components(separatedBy: ", ")
            result += "\(names[0]), \(newNames[0]), and \(newNames[1])"
        } else {
            result += "\(names[0]), and \(names[1])"
        }
    }
    
    /// This helper function handles an input with an arrays of names. Ex: ["Peter", "Jon", "Cris"]
    /// - Parameters:
    ///   - names: String array with names
    ///   - lastName: Last item in the array of name. Not to be confuse with Peter's Last Name.
    ///   - result: String of formatted names
    ///   - nameWithComas: String Array containing a string with two name separated with comma. Ex: ["Peter, Jon", "Cris"]
    func handlesArraysOfNames(_ names: [String], _ lastName: String, _ result: inout String, _ nameWithCommas: inout [String] ) {
        var names = nameWithCommas.isEmpty ? names : nameWithCommas
        for name in names {
            checkNameWithCommasOrDoubleQuotes(name, &nameWithCommas)
            if names.count == 1 && !nameWithCommas.isEmpty {
                result += "\(nameWithCommas[0]), and \(nameWithCommas[1])"
                break
            }
            
            if names.count == 2 {
                handleNamesCountEqualsTwo(&names, &result)
                break
            }
            
            if lastName == name {
                result += "and \(name)"
            } else if name.uppercased() == name {
                result += "\(name), "
            } else if lastName.uppercased() == name {
                result += "and \(name)"
            } else {
                result += "\(name), "
            }
            
        }
    }
    
    /// This helper checks if string contains comma or double quotes and properly format the string name.
    /// - Parameters:
    ///   - name: String containing comma or double quotes.
    ///   - nameWithComas: String Array containing value with commas.
    func checkNameWithCommasOrDoubleQuotes(_ name: String?, _ nameWithCommas: inout [String]) {
        if  let name = name, name.contains("\"") && name.contains(",") {
            let newNames = name.replacingOccurrences(of: "\"", with: "")
            nameWithCommas = newNames.components(separatedBy: ", ")
        }
        
        if let name = name,  name.contains(",") && !name.contains("\"") {
            nameWithCommas = name.components(separatedBy: ", ")
        }
    }
}

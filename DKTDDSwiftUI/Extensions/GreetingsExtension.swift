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
    /// - Returns: result, a string with names formatted 
    func handleNamesCountEqualsTwo(_ names: [String]) -> String {
        var result = ""
        if names[0].contains(",") {
            let newNames = names[0].components(separatedBy: ", ")
            result = "\(newNames[0]), \(newNames[1]), and \(names[1])"
        } else if names[1].contains(","){
            let newNames = names[1].components(separatedBy: ", ")
            result = "\(names[0]), \(newNames[0]), and \(newNames[1])"
        } else {
            result = "\(names[0]), and \(names[1])"
        }
        return result
    }
    
    /// This helper function handles an input with an arrays of names. Ex: ["Peter", "Jon", "Cris"]
    /// - Parameters:
    ///   - names: String array with names
    ///   - lastName: Last item in the array of name. Not to be confuse with Peter's Last Name.
    ///   - result: String of formatted names
    ///   - nameWithComas: String Array containing a string with two name separated with comma. Ex: ["Peter, Jon", "Cris"]
    func handlesArraysOfNamesAndReturnResult(_ names: [String]) -> String{
        var result = ""
        let lastName = names.last ?? ""
        for name in names {
            let nameWithCommas = checkNameWithCommasOrDoubleQuotes(name)
            if names.count == 1 && !nameWithCommas.isEmpty {
                result += "\(nameWithCommas[0]), and \(nameWithCommas[1])"
                return result
            }
            
            if names.count == 2 {
                result = handleNamesCountEqualsTwo(names)
                return result
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
        return result
    }
    
    /// This helper checks if string contains comma or double quotes and properly format the string name.
    /// - Parameters:
    ///   - name: String containing comma or double quotes.
    ///   - nameWithComas: String Array containing value with commas.
    func checkNameWithCommasOrDoubleQuotes(_ name: String?) -> [String] {
        var nameWithCommas = [String]()
        if  let name = name, name.contains("\""), name.contains(",") {
            let newNames = name.replacingOccurrences(of: "\"", with: "")
            nameWithCommas = newNames.components(separatedBy: ", ")
        }
        
        if let name = name,  name.contains(","), !name.contains("\"") {
            nameWithCommas = name.components(separatedBy: ", ")
        }
        return nameWithCommas
    }
}

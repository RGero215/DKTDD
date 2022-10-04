//
//  Greetings.swift
//  DKTDDSwiftUI
//
//  Created by Ramon Geronimo on 9/30/22.
//

import Foundation

struct Greetings {
    // MARK: Methods
    /// Greet takes a string  with names.
    /// - Parameters:
    ///   - name: String name
    /// - Returns: return a string "Hello, name" if one name  || "Hello, my friend" if empty string or nil || "HELLO, NAME" if uppercase name
    func greet(name: String? = nil) -> String {
        guard let name = name, name != "" else { return "Hello, my friend" }

        let nameWithCommas = checkNameWithCommasOrDoubleQuotes(name)
        var result = handlesArraysOfNamesAndReturnResult(nameWithCommas)
        result = nameWithCommas.count >= 2 ? "Hello, \(result)" : "Hello, \(name)"
        
        return name == name.uppercased() ? "HELLO, \(name)" : result
    }
    
    
    /// Greet takes a String array and return a string of names formatted. Ex: ["Jon", "Peter", "Cris"] -> "Hello, Jon, Peter and Cris"
    /// this declaration was created to avoid overload.
    /// - Parameter names: String array of names
    /// - Returns: String with names formatted
    func greet(names: [String]?) -> String {
        guard let names = names else { return "Hello, my friend" }

        let result = handlesArraysOfNamesAndReturnResult(names)
        let namesString = result == "and \(names[0])" ?  names[0] : result
        
        return names.count >= 2 ? "Hello, \(result)" : "Hello, \(namesString)"
    }
}

//
//  Greetings.swift
//  DKTDDSwiftUI
//
//  Created by Ramon Geronimo on 9/30/22.
//

import Foundation

struct Greetings {
    // MARK: Properties
    private var result = ""
    private var nameWithCommas = [String]()
    private var lastName = ""
    private var namesString = ""
    
    // MARK: Methods
    /// Greet takes a string  with names.
    /// - Parameters:
    ///   - name: String name
    /// - Returns: return a string "Hello, name" if one name  || "Hello, my friend" if empty string or nil || "HELLO, NAME" if uppercase name
    mutating func greet(name: String? = nil) -> String {
        guard let name = name, name != "" else {
            return "Hello, my friend"
        }

        checkNameWithCommasOrDoubleQuotes(name, &nameWithCommas)
        lastName = nameWithCommas.last ?? ""
        
        handlesArraysOfNames(nameWithCommas, lastName, &result, &nameWithCommas)
        result = nameWithCommas.count >= 2 ? "Hello, \(result)" : "Hello, \(name)"

        return name == name.uppercased() ? "HELLO, \(name)" : result
    }
    
    
    /// Greet takes a String array and return a string of names formatted. Ex: ["Jon", "Peter", "Cris"] -> "Hello, Jon, Peter and Cris"
    /// this declaration was created to avoid overload.
    /// - Parameter names: String array of names
    /// - Returns: String with names formatted
    mutating func greet(names: [String]?) -> String {
        guard let names = names else { return "Hello, my friend" }
        lastName = names.last ?? ""
       
        handlesArraysOfNames(names, lastName, &result, &nameWithCommas)
        namesString = nameWithCommas.isEmpty ? names[0] : result
        
        return names.count >= 2 ? "Hello, \(result)" : "Hello, \(namesString)"
    }
}

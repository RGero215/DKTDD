//
//  Greetings.swift
//  DKTDDSwiftUI
//
//  Created by Ramon Geronimo on 9/30/22.
//

import Foundation

class Greetings {
    
    func greet(name: String? = nil, names: [String]? = nil) -> String {
        var result = ""
        var nameWithComas = [String]()
        var name = name
        var lastName = ""
        
        if names?.count == 1 {
            name = names?[0]
        }
        
        checkeNameWithComasOrDoubleQuotes(name, &nameWithComas)
        
        if nameWithComas.count >= 2 {
            lastName = nameWithComas.last ?? ""
            handlesArraysOfNames(nameWithComas, lastName, &result, &nameWithComas)
            return "Hello, \(result)"
        }
        
        if let name = name, name != "" && names == nil {
            return name == name.uppercased() ? "HELLO, \(name)" : "Hello, \(name)"
        }

        if let names = names, names.count >= 2 {
            lastName = names.last ?? ""
            handlesArraysOfNames(names, lastName, &result, &nameWithComas)
            return "Hello, \(result)"
        }
        
        
        return "Hello, \(names?[0] ?? "my friend")"
    }
}

extension Greetings {
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
    
    func handlesArraysOfNames(_ names: [String], _ lastName: String, _ result: inout String, _ nameWithComas: inout [String] ) {
        var names = nameWithComas.isEmpty ? names : nameWithComas
        for name in names {
            checkeNameWithComasOrDoubleQuotes(name, &nameWithComas)
            if names.count == 1 && !nameWithComas.isEmpty {
                result += "\(names[0]), and \(names[1])"
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
    
    func checkeNameWithComasOrDoubleQuotes(_ name: String?, _ nameWithComas: inout [String]) {
        if  let name = name, name.contains("\"") && name.contains(",") {
            let newNames = name.replacingOccurrences(of: "\"", with: "")
            nameWithComas = newNames.components(separatedBy: ", ")
        }
        
        if let name = name,  name.contains(",") && !name.contains("\"") {
            nameWithComas = name.components(separatedBy: ", ")
        }
    }
}

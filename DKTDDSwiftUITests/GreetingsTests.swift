//
//  Greetings.swift
//  DKTDDSwiftUITests
//
//  Created by Ramon Geronimo on 9/30/22.
//

import XCTest
@testable import DKTDDSwiftUI

class GreetingsTests: XCTestCase {
    var sut: Greetings!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = Greetings()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    // MARK: 1. Greet a single
    // Write a method greet(name) that uses name in a simple greeting. For example, when name is ‘Bob’, the method
    // should return a string “Hello, Bob.”
    func testValue_ShouldReturnGreetingAndName() {
        let greetings = sut.greet(name: "Bob")
        let expected = "Hello, Bob"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: 2. Handle nulls by using a stand-in
    // Handle nulls by introducing a stand-in. For example, when name is null, then the method should return the string
    // “Hello, my friend.”
    func testValue_ShouldHandleEmptyString() {
        let greetings = sut.greet(name: "")
        let expected = "Hello, my friend"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: Handle Nil
    func testValue_ShouldHandleNil() {
        let greetings = sut.greet(name: nil)
        let expected = "Hello, my friend"
        XCTAssertEqual(greetings, expected)
    }
    
    // MARK: 3. Handle shouting
    // When a name is all uppercase, then the method should shout back to the user. For example, when name is “JERRY”
    // then the method should return the string “HELLO JERRY!”
    func testValue_ShouldShoutWithUppercase() {
        let greetings = sut.greet(name: "BOB")
        let expected = "HELLO, BOB"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: Names Not Nil
    func testValue_NamesShouldNotBeNil() {
        let greetings = sut.greet(names: ["Bob"])
        let expected = "Hello, Bob"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: 4. Handle two names
    // Handle the input of two names. When name is an array of two names, then both names should be printed. For
    // example, when name is [“Jill”, “Jane”], then the method should return the string “Hello, Jill and Jane”
    func testValues_ShouldHandleTwoName() {
        let greetings = sut.greet(names: ["Bob", "Robert"])
        let expected = "Hello, Bob, and Robert"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: Helper Method 3 names
    func testValues_HandleArraysOfNamesHelperMethod() {
        var result = ""
        let array = ["Bob", "Robert", "Juan"]
        let lastName = array[array.count - 1]
        var nameWithComas = [String]()
        
        sut.handlesArraysOfNames(array, lastName, &result, &nameWithComas)
        let expected = "Bob, Robert, and Juan"
        XCTAssertEqual(result, expected)
    }
    
    // MARK: Helper Method 2 names
    func testValues_HandleArraysOfNamesHelperMethodWithTwoNames() {
        var result = ""
        let array = ["Bob", "Robert"]
        let lastName = array[array.count - 1]
        var nameWithComas = [String]()
        
        sut.handlesArraysOfNames(array, lastName, &result, &nameWithComas)
        let expected = "Bob, and Robert"
        XCTAssertEqual(result, expected)
    }
    
    // MARK: 5. Handle more than two names
    func testValues_ShoutHandleMoreThanTwo() {
        let greetings = sut.greet(names: ["Bob", "Robert", "Juan"])
        let expected = "Hello, Bob, Robert, and Juan"
        XCTAssertEqual(greetings, expected)
    }
    
    // MARK: 6. Handle mixing of normal and shouted names
    // Handle the arbitrarily names of input. When name represents more than two names, separate them with commas
    // and close with and Oxford command “and”. For example, when name is [“Amy”, “Brian”, “Charlotte”], then the
    // method should return the string “Hello, Amy, Brian, and Charlotte”
    func testValues_MixingShoutAndNormalNames() {
        let greetings = sut.greet(names: ["Bob", "ROBERT", "Juan"])
        let expected = "Hello, Bob, ROBERT, and Juan"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: Ending with Shout
    func testValues_MixingShoutAndNormalNamesEndingInShoutName() {
        let greetings = sut.greet(names: ["Bob", "ROBERT", "Juan", "PEDRO"])
        let expected = "Hello, Bob, ROBERT, Juan, and PEDRO"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: 7. Split names with commas into separate entries
    // If any entries in name are a string containing a comma, split it as its own input. For example, when name is [“Bob”,
    // “Charlie, Dianne”], then the method should return the string “Hello, Bob, Charlie, and Dianne.”
    func testValues_StringContainingComa() {
        let greetings = sut.greet(name: "Bob, Robert")
        let expected = "Hello, Bob, and Robert"
        XCTAssertEqual(greetings, expected)
    }
    
    // MARK: 8. Allow commas in entries to be escapes
    // Allow the input to escape intentional commas introduced by the previous requirement. These can be escaped in the
    // same manner that CSV is, with double quotes surrounding the entry. For example, when name is “Bob”, “”Charlie,
    // Dianne””, then the method should return the string “Hello, Bob and Charlie, Dianne.”
    func testValues_StringContainingDoubleQuotesAndComas() {
        let greetings = sut.greet(name: "Bob, \"Robert, Charlie\"")
        let expected = "Hello, Bob, Robert, and Charlie"
        XCTAssertEqual(greetings, expected)
    }
    
    // MARK: Allow commas in entries array
    func testValues_ArrayContainingComa() {
        let greetings = sut.greet(names: ["Bob, Robert"])
        let expected = "Hello, Bob, and Robert"
        XCTAssertEqual(greetings, expected)
    }
    
    //MARK: Helper Handle Array of two
    func testValues_HelperToHandleArrayCountOfTwo() {
        var result = ""
        var names = ["Juan", "Bob, Robert"]
        sut.handleNamesCountEqualsTwo(&names, &result)
        let expected = "Juan, Bob, and Robert"
        XCTAssertEqual(result, expected)
    }
    
    // MARK: Allow commas in array of two at second index
    func testValues_ArrayContainingComaTwoAtLastIndex() {
        let greetings = sut.greet(names: ["Juan", "Bob, Robert"])
        let expected = "Hello, Juan, Bob, and Robert"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: Allow commas in array of two at first index
    func testValues_ArrayContainingComaTwoAtFirstIndex() {
        let greetings = sut.greet(names: ["Juan, Bob", "Robert"])
        let expected = "Hello, Juan, Bob, and Robert"
        XCTAssertEqual(greetings, expected)
    }
    // MARK: Allow commas in array with more than two values
    func testValues_ArrayContainingComasWithMoreThanTwoValues() {
        let greetings = sut.greet(names: ["Juan, Bob", "Robert", "Pedro"])
        let expected = "Hello, Juan, Bob, Robert, and Pedro"
        XCTAssertEqual(greetings, expected)
    }
}

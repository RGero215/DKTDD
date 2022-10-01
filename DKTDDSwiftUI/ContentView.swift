//
//  ContentView.swift
//  DKTDDSwiftUI
//
//  Created by Ramon Geronimo on 9/30/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Diamond Kinectics")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding()
            List(0 ..< 4) {item in
                Text("Swing \(item)")
            }
            .listStyle(PlainListStyle())
            
        }
        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

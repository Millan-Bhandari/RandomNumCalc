//
//  ContentView.swift
//  RandomNumCalc
//
//  Created by Millan Bhandari on 8/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var num1 = 0
    @State private var num2 = 0
    @State private var finalCalc = 0
    @State private var text = 0
    @State private var text1 = ""
    @State private var X = ""
    @State var buttonTapped = 0
    @State var selection = ""
    var body: some View {
        VStack {
            Text("Number Flash Cards")
                .font(.title)
                .fontWeight(.bold)
            Text("Tap the numbers to see answer")
                .font(.footnote)
            Picker("Function", selection: $selection) {
                Text("Multiply").tag("Multiply")
                Text("Addition").tag("Addition")
                Text("Subtraction").tag("Subtraction")
                Text("Division").tag("Division")
            }
            .onChange(of: selection, perform: { newValue in
                randomCalc()
                reset()
            })
            .pickerStyle(.wheel)
            Spacer()
            Text( "\(text)" + " \(X)" + " \(text1)").cornerRadius(10)
                .frame(width: 120, height: 120, alignment: .center)
                .onTapGesture {
                    if selection == "Multiply" {
                        text = num1 * num2
                        clear()
                    }
                    if selection == "Addition" {
                        text = num1 + num2
                        clear()
                    }
                    if selection == "Subtraction" {
                        text = num1 - num2
                        clear()
                    }
                    if selection == "Division" {
                        text = num1 / num2
                        clear()
                    }
                }
                .background(.green)
            Button("New") {
                randomCalc()
                reset()
            }
            Spacer()
                .onAppear {
                    randomCalc()
                    reset()
                }
        }
    }
    func reset() {
        if selection == "Multiply" {
            text = num1
            X = "X"
            text1 = String(num2)
        }
        if selection == "Addition" {
            text = num1
            X = "+"
            text1 = String(num2)
        }
        if selection == "Subtraction" {
            text = num1
            X = "-"
            text1 = String(num2)
        }
        if selection == "Division" {
            text = num1
            X = "÷"
            text1 = String(num2)
        }
        return
    }
    func randomCalc() {
        if selection == "Multiply" {
        num1 = Int.random(in: 1...20)
        num2 = Int.random(in: 1...20)
        }
        if selection == "Addition" {
            num1 = Int.random(in: 1...20)
            num2 = Int.random(in: 1...20)
        }
        if selection == "Subtraction" {
            num1 = Int.random(in: 1...20)
            num2 = Int.random(in: 1...20)
            if num1 < num2 {
                randomCalc()
            }
        }
        if selection == "Division" {
            num1 = Int.random(in: 1...20)
            num2 = Int.random(in: 1...20)
            if num1 < num2 {
                randomCalc()
            }
        }
    }
    func clear() {
        X = ""
        text1 = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

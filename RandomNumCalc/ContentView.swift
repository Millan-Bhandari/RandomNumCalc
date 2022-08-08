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
    var body: some View {
        VStack {
            Text("Number Flash Cards")
                .font(.title)
                .fontWeight(.bold)
            Text("Tap the numbers to see answer")
                .font(.footnote)
            Spacer()
            Text( "\(text)" + " \(X)" + " \(text1)").cornerRadius(10)
                .frame(width: 120, height: 120, alignment: .center)
                .onTapGesture {
                    text = num1 * num2
                    X = ""
                    text1 = ""
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
        text = num1
        X = "X"
        text1 = String(num2)
    }
    func randomCalc() {
        num1 = Int.random(in: 1...20)
        num2 = Int.random(in: 1...20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

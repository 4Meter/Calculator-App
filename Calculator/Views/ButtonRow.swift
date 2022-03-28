//
//  ButtonRow.swift
//  Calculator
//
//  Created by user on 2022/3/27.
//

import SwiftUI

let row = 4

struct ButtonRow: View {
    
    var labels:[String] = ["","","",""]
    var colors:[Color] = [
        Color(.darkGray),
        Color(.darkGray),
        Color(.darkGray),
        .orange]
    
    var body: some View {
        HStack {
            ForEach(0..<row) { index in
                SingleButton(
                    label: labels[index],
                    color: colors[index])
                
            }
        }
    }
}

struct ButtonRow2: View {
    
    var labels:[String] = ["","","",""]
    var colors:[Color] = [
        Color(.darkGray),
        Color(.darkGray),
        Color(.darkGray),
        .orange]
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                SingleButton(label: labels[0], color: colors[0])
                ForEach(2..<4) { index in
                    SingleButton(
                        label: labels[index],
                        color: colors[index])
                    
                }
            }
        }
    }
}

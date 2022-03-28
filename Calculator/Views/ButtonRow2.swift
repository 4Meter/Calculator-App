//
//  ButtonRow2.swift
//  Calculator
//
//  Created by user on 2022/3/28.
//

import SwiftUI

let row2 = 3

struct ButtonRow2: View {
    
    var labels:[String] = ["","",""]
    var colors:[Color] = [
        Color(.darkGray),
        Color(.darkGray),
        .orange]
    
    var body: some View {
        HStack {
            ForEach(1..<4) { index in
                SingleButton(
                    label: labels[index],
                    color: colors[index])
                
            }
        }
    }
}

struct ButtonRow2_Previews: PreviewProvider {
    static var previews: some View {
        
        ButtonRow2()
    }
}

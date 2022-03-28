//
//  SingleButton.swift
//  Calculator
//
//  Created by user on 2022/3/27.
//

import SwiftUI

struct SingleButton: View {
    
    @EnvironmentObject var cal:Calculator
    
    var label: String
    var labelColor : Color = .white
    var color: Color
    
    var body: some View {
        
        Button {
            cal.buttonPressed(label)
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(color)
                Text(label)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .foregroundColor(labelColor)
            }
        }
    }
}



struct SingleButton_Previews: PreviewProvider {
    static var previews: some View {
        SingleButton(label: "1", color: .gray)
            .previewLayout(.fixed(width: 50, height: 50))
            .environmentObject(Calculator())
    }
}

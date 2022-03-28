//
//  SingleButton2.swift
//  Calculator
//
//  Created by user on 2022/3/28.
//

import SwiftUI

struct SingleButton2: View {
    
    @EnvironmentObject var cal:Calculator
    
    var label: String
    var labelColor : Color = .white
    var color: Color
    
    var body: some View {
        
        GeometryReader{ geo in
            Button {
                cal.buttonPressed(label)
            } label: {
                ZStack(alignment: .leading) {
                    Capsule()
                        .foregroundColor(color)
                    Text(label)
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .foregroundColor(labelColor)
                        .frame(width: geo.size.height, height: geo.size.height, alignment: .center)
                }
            }
        }
    }
}

//
//  ContentView.swift
//  Calculator
//
//  Created by user on 2022/3/27.
//

import SwiftUI

struct CalculatorHomeView: View {
    
    @EnvironmentObject var cal:Calculator
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            GeometryReader {geo in
                
                VStack {
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Text(cal.displayValue)
                            .foregroundColor(.white)
                            .font(.system(size: 300))
                            .padding(.trailing)
                            .minimumScaleFactor(0.15)
                            .lineLimit(1)
                            .frame(width:geo.size.width*0.9 , height: 100, alignment: .bottomTrailing)
                    }
                    
                    VStack {
                        // MARK: Row 1
                        ButtonRow(
                            labels:["C","\u{00B1}","%","\u{00F7}"])
                        // MARK: Row 2
                        ButtonRow(
                            labels: ["7","8","9","\u{00D7}"])
                        // MARK: Row 3
                        ButtonRow(
                            labels: ["4","5","6","-"])
                        // MARK: Row 4
                        ButtonRow(
                            labels: ["1","2","3","+"])
                        // MARK: Row 5
//                        ButtonRow(
//                            labels: ["0","",".","="])
                        HStack {
                            GeometryReader { geo2 in
                                let w = geo2.size.width
                                let h = geo2.size.height
                                HStack{
                                    SingleButton2( label: "0", color: Color(.darkGray))
                                        .frame(width: (w+2*h)/3)
                                    SingleButton( label: ".", color: Color(.darkGray))
                                    SingleButton( label: "=", color: .orange)
                                }
                            }
                        }
                    }
                    .frame(height: geo.size.height*0.6)
                }
                
            }
            .padding(.horizontal,10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorHomeView()
            .environmentObject(Calculator())
    }
}

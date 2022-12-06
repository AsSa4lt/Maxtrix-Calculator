//
//  AdditionModularSheet.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import SwiftUI

struct AdditionModularSheet: View {
    @StateObject var matrixA: MatrixAModular
    @StateObject var matrixB: MatrixBModular
    @StateObject var Data = Design()
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
        VStack{
            Text("The sum of A and B is computed by adding corresponding elements of A and B. Then finding the remainder of result divided by modulo ").font(.title2).multilineTextAlignment(.center).padding(.bottom).foregroundColor(Color(Data.ColorText))
            VStack{
                ForEach(0...matrixA.rows-1, id: \.self){ row in
                    HStack(spacing: 0){
                        ForEach(0...matrixA.columns-1, id: \.self){ column in
                            Text("\(matrixA.data[row][column])+\(matrixB.data[row][column])")
                                .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/27))
                                .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7).foregroundColor(Color(Data.ColorText))
                        }
                        
                    }
                }
            }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(Color(Data.ColorMatrix)))
            Spacer()
        })
    }
}

struct AdditionModularSheet_Previews: PreviewProvider {
    static var previews: some View {
        AdditionModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular())
    }
}

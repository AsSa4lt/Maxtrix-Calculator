//
//  MultiplySheet.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import SwiftUI

struct MultiplySheet: View {
    @StateObject var matrixA: MatrixA
    @StateObject var matrixB: MatrixB
    @StateObject var Data = Design()
    @AppStorage("multipykoef") var koef = [[String]](repeating: [String](repeating: "", count: 7), count: 7)
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
        ScrollView{
            VStack{
                Text("The resulting matrix has the number of rows of the first and the number of columns of the second matrix").font(.title3).multilineTextAlignment(.center).padding(.bottom).foregroundColor(Color(Data.ColorText))
                ForEach(0..<Result().rows, id: \.self){ row in
                    VStack{
                        ForEach(0..<Result().columns, id: \.self){ col in
                            Text("\(koef[row][col])").foregroundColor(Color(Data.ColorText)).font(.title2)
                        }
                    }
                    .padding(.bottom)
                }
                
                Text("Result").font(.title).multilineTextAlignment(.center).padding(.top).foregroundColor(Color(Data.ColorText))
                VStack{
                    ForEach(0..<Result().rows, id: \.self){ row in
                        HStack(spacing: 0){
                            ForEach(0..<Result().columns, id: \.self){ column in
                                Text("\(forTrailingZero(temp: Result().data[row][column]))")
                                    .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/22))
                                    .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).foregroundColor(Color(Data.ColorText))
                            }
                            
                        }
                    }
                }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(.blue))
            }.onAppear{
                if Result().lastOpeation == 3{
                    setKoef(var: matrixA, var: matrixB)
                }
                if Result().lastOpeation == 4{
                    setKoef(var: matrixB, var: matrixA)
                }
            }
        })
    }
    func setKoef(var matrix1: MatrixA, var matrix2: MatrixB){
        for i in 0..<Int(matrix1.rows){
            for j in 0..<Int(matrix2.columns){
                koef[i][j]="a\(i+1)\(j+1)="
                for k in 0..<Int(matrix1.columns){
                    if k == 0{
                        koef[i][j]+="\(forTrailingZero(temp: matrix1.data[i][k]))"+"\u{00D7}"+"\(forTrailingZero(temp: matrix2.data[k][j]))"
                    }else{
                        koef[i][j]+="+\(forTrailingZero(temp: matrix1.data[i][k]))"+"\u{00D7}"+"\(forTrailingZero(temp: matrix2.data[k][j]))"
                    }
                }
                koef[i][j] += "=\(forTrailingZero(temp: Result().data[i][j]))"
            }
        }
    }
    
    func setKoef(var matrix1: MatrixB, var matrix2: MatrixA){
        for i in 0..<Int(matrix1.rows){
            for j in 0..<Int(matrix2.columns){
                koef[i][j]="a\(i+1)\(j+1)="
                for k in 0..<Int(matrix1.columns){
                    if k == 0{
                        koef[i][j]+="\(forTrailingZero(temp: matrix1.data[i][k]))"+"\u{00D7}"+"\(forTrailingZero(temp: matrix2.data[k][j]))"
                    }else{
                        koef[i][j]+="+\(forTrailingZero(temp: matrix1.data[i][k]))"+"\u{00D7}"+"\(forTrailingZero(temp: matrix2.data[k][j]))"
                    }
                }
                koef[i][j] += "=\(forTrailingZero(temp: Result().data[i][j]))"
            }
        }
    }
    
}

struct MultiplySheet_Previews: PreviewProvider {
    static var previews: some View {
        MultiplySheet(matrixA: MatrixA(), matrixB: MatrixB())
    }
}

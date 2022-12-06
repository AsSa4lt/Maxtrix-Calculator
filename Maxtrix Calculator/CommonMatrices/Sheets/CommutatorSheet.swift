//
//  CommutatorSheet.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 07.12.2022.
//

import SwiftUI

struct CommutatorSheet: View {
    @StateObject var matrixA: MatrixA
    @StateObject var matrixB: MatrixB
    @StateObject var result: Result
    @State var data1 = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
    @State var data2 = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
    @State var data3 = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
    @AppStorage("commKoef1") var koef1 = [[String]](repeating: [String](repeating: "", count: 7), count: 7)
    @AppStorage("commKoef2") var koef2 = [[String]](repeating: [String](repeating: "", count: 7), count: 7)
    @StateObject var Data = Design()
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
        ScrollView{
            VStack{
                Text("The resulting matrix has the same count of rows and columns: [A, B] = A\u{00D7}B - B\u{00D7}A").font(.title3).multilineTextAlignment(.center).padding(.bottom).foregroundColor(Color(Data.ColorText))
                
                Text("A\u{00D7}B").font(.title).multilineTextAlignment(.center)
                    .foregroundColor(Color(Data.ColorText))
                ForEach(0..<Result().rows, id: \.self){ row in
                    VStack{
                        ForEach(0..<Result().columns, id: \.self){ col in
                            Text("\(koef1[row][col])").foregroundColor(Color(Data.ColorText)).font(.title2)
                        }
                    }
                    
                }
                
                VStack{
                    ForEach(0..<result.rows, id: \.self){ row in
                        HStack(spacing: 0){
                            ForEach(0..<result.columns, id: \.self){ column in
                                Text("\(forTrailingZero(temp: data1[row][column]))")
                                    .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/22))
                                    .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).foregroundColor(Color(Data.ColorText))
                            }
                            
                        }
                    }
                }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(.blue)).padding(.bottom)
                
                Text("B\u{00D7}A").font(.title).multilineTextAlignment(.center).foregroundColor(Color(Data.ColorText))
                ForEach(0..<Result().rows, id: \.self){ row in
                    VStack{
                        ForEach(0..<Result().columns, id: \.self){ col in
                            Text("\(koef2[row][col])").foregroundColor(Color(Data.ColorText)).font(.title2)
                        }
                    }
                    
                }

                VStack{
                    ForEach(0..<result.rows, id: \.self){ row in
                        HStack(spacing: 0){
                            ForEach(0..<result.columns, id: \.self){ column in
                                Text("\(forTrailingZero(temp: data2[row][column]))")
                                    .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/22))
                                    .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).foregroundColor(Color(Data.ColorText))
                            }
                            
                        }
                    }
                }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(.blue))
                
                Text("Result").font(.title).multilineTextAlignment(.center).padding(.top).foregroundColor(Color(Data.ColorText))
                VStack{
                    ForEach(0..<result.rows, id: \.self){ row in
                        HStack(spacing: 0){
                            ForEach(0..<result.columns, id: \.self){ column in
                                Text("\(forTrailingZero(temp: data3[row][column]))")
                                    .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/22))
                                    .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).foregroundColor(Color(Data.ColorText))
                            }
                            
                        }
                    }
                }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(.blue))
                
            }.onAppear{
                setResultCommut()
            }
        })
    }
    func setResultCommut(){
        multipy(var: matrixA, var: matrixB, var: result)
        data1 = result.data
        for i in 0..<Int(matrixA.rows){
            for j in 0..<Int(matrixB.columns){
                koef1[i][j]="a\(i+1)\(j+1)="
                for k in 0..<Int(matrixA.columns){
                    if k == 0{
                        koef1[i][j]+="\(forTrailingZero(temp: matrixA.data[i][k]))"+"\u{00D7}"+"\(forTrailingZero(temp: matrixA.data[k][j]))"
                    }else{
                        koef1[i][j]+="+\(forTrailingZero(temp: matrixB.data[i][k]))"+"\u{00D7}"+"\(forTrailingZero(temp: matrixB.data[k][j]))"
                    }
                }
                koef1[i][j] += "=\(forTrailingZero(temp: Result().data[i][j]))"
            }
        }
        
        multipy(var: matrixB, var: matrixA, var: result)
        data2 = result.data
        
        for i in 0..<Int(matrixB.rows){
            for j in 0..<Int(matrixA.columns){
                koef2[i][j]="a\(i+1)\(j+1)="
                for k in 0..<Int(matrixB.columns){
                    if k == 0{
                        koef2[i][j]+="\(forTrailingZero(temp: matrixB.data[i][k]))"+"\u{00D7}"+"\(forTrailingZero(temp: matrixA.data[k][j]))"
                    }else{
                        koef2[i][j]+="+\(forTrailingZero(temp: matrixB.data[i][k]))"+"\u{00D7}"+"\(forTrailingZero(temp: matrixA.data[k][j]))"
                    }
                }
                koef2[i][j] += "=\(forTrailingZero(temp: Result().data[i][j]))"
            }
        }
        commut(var: matrixA, var: matrixB, var: result)
        data3 = result.data
    }
}

struct CommutatorSheet_Previews: PreviewProvider {
    static var previews: some View {
        CommutatorSheet(matrixA: MatrixA(), matrixB: MatrixB(), result: Result())
    }
}

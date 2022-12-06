//
//  CommutatorModularSheet.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import SwiftUI

struct CommutatorModularSheet: View {
    @StateObject var matrixA: MatrixAModular
    @StateObject var matrixB: MatrixBModular
    @StateObject var result: ResultModular
    @State var data1 = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 7)
    @State var data2 = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 7)
    @State var data3 = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 7)
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
                ForEach(0..<ResultModular().rows, id: \.self){ row in
                    VStack{
                        ForEach(0..<ResultModular().columns, id: \.self){ col in
                            Text("\(koef1[row][col])").foregroundColor(Color(Data.ColorText)).font(.title2)
                        }
                    }
                    
                }
                
                VStack{
                    ForEach(0..<result.rows, id: \.self){ row in
                        HStack(spacing: 0){
                            ForEach(0..<result.columns, id: \.self){ column in
                                Text("\(data1[row][column])")
                                    .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/22))
                                    .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).foregroundColor(Color(Data.ColorText))
                            }
                            
                        }
                    }
                }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(.blue)).padding(.bottom)
                
                Text("B\u{00D7}A").font(.title).multilineTextAlignment(.center).foregroundColor(Color(Data.ColorText))
                ForEach(0..<ResultModular().rows, id: \.self){ row in
                    VStack{
                        ForEach(0..<ResultModular().columns, id: \.self){ col in
                            Text("\(koef2[row][col])").foregroundColor(Color(Data.ColorText)).font(.title2)
                        }
                    }
                    
                }

                VStack{
                    ForEach(0..<result.rows, id: \.self){ row in
                        HStack(spacing: 0){
                            ForEach(0..<result.columns, id: \.self){ column in
                                Text("\(data2[row][column])")
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
                                Text("\(data3[row][column])")
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
        multiplyModular(var: matrixA, var: matrixB, var: result)
        data1 = result.data
        for i in 0..<Int(matrixA.rows){
            for j in 0..<Int(matrixB.columns){
                koef1[i][j]="a\(i+1)\(j+1)="
                for k in 0..<Int(matrixA.columns){
                    if k == 0{
                        koef1[i][j]+="\(matrixA.data[i][k])"+"\u{00D7}"+"\(matrixA.data[k][j])"
                    }else{
                        koef1[i][j]+="+\(matrixB.data[i][k])"+"\u{00D7}"+"\(matrixB.data[k][j])"
                    }
                }
                koef1[i][j] += "=\(ResultModular().data[i][j])"
            }
        }
        
        multiplyModular(var: matrixB, var: matrixA, var: result)
        data2 = result.data
        
        for i in 0..<Int(matrixB.rows){
            for j in 0..<Int(matrixA.columns){
                koef2[i][j]="a\(i+1)\(j+1)="
                for k in 0..<Int(matrixB.columns){
                    if k == 0{
                        koef2[i][j]+="\(matrixB.data[i][k])"+"\u{00D7}"+"\(matrixA.data[k][j])"
                    }else{
                        koef2[i][j]+="+\(matrixB.data[i][k])"+"\u{00D7}"+"\(matrixA.data[k][j])"
                    }
                }
                koef2[i][j] += "=\(ResultModular().data[i][j])"
            }
        }
        commutModular(var: matrixA, var: matrixB, var: result)
        data3 = result.data
    }
}

struct CommutatorModularSheet_Previews: PreviewProvider {
    static var previews: some View {
        CommutatorModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular(), result: ResultModular())
    }
}

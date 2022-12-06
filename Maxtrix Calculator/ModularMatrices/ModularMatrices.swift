//
//  ModularMatrices.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import SwiftUI

struct ModularMatrices: View {
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumIntegerDigits = 3
        formatter.maximumFractionDigits = 0
        formatter.minimum = 0
        formatter.maximum = 1000
        return formatter
        
    }()
    let formatterModulo: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumIntegerDigits = 3
        formatter.maximumFractionDigits = 0
        formatter.minimum = 2
        formatter.maximum = 1000
        return formatter
        
    }()
    
    @StateObject var matrixA: MatrixAModular
    @StateObject var matrixB: MatrixBModular
    @StateObject var result: ResultModular
    @StateObject var Data = Design()
    
    @State var stepSolution: Bool = false
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
            ScrollView{
                VStack{
                    HStack{
                        Spacer()
                        Text("Modulo:").foregroundColor(Color(Data.ColorText)).font(.system(size: UIScreen.main.bounds.size.width/15))
                        TextField("\(result.modulo)", value: $result.modulo, formatter: formatterModulo).padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/15)).foregroundColor(Color(Data.ColorText))
                            .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/10)
                        Spacer()
                    }
                    Group{
                        HStack{
                            VStack{
                                Text("Rows: \(matrixA.rows)").foregroundColor(Color(Data.ColorText)).font(.title2)
                                Slider(value: .convert(from: $matrixA.rows), in: 1...7, step: 1).frame(width: UIScreen.main.bounds.size.width/3.5).accentColor(Color.red).padding(1).overlay(RoundedRectangle(cornerRadius: 3.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                                    .onChange(of: matrixA.rows){ _ in
                                    result.lastOperation = 0
                                }
                            }
                            VStack{
                                Text("Columns: \(matrixA.columns)").foregroundColor(Color(Data.ColorText)).font(.title2)
                                Slider(value: .convert(from: $matrixA.columns), in: 1...7, step: 1).frame(width: UIScreen.main.bounds.size.width/3.5).accentColor(Color.green).padding(1).overlay(RoundedRectangle(cornerRadius: 3.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                                    .onChange(of: matrixA.columns){ _ in
                                    result.lastOperation = 0
                                }
                            }
                        }
                        HStack{
                            Text("Matrix A:").foregroundColor(Color(Data.ColorText)).font(.title)
                            Button("A\u{1D40}") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                transposeModular(var: matrixA, var: result)
                                
                            }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("A\u{207B}\u{00B9}") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                inverzeModular(var: matrixA, var: result)
                                
                            }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                        }
                        
                        VStack{
                            ForEach(0...matrixA.rows-1, id: \.self){ row in
                                HStack(spacing: 0){
                                    ForEach(0...matrixA.columns-1, id: \.self){ column in
                                        TextField("\(matrixA.data[row][column])", value: $matrixA.data[row][column], formatter: formatter)
                                            .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/20)).foregroundColor(Color(Data.ColorText))
                                            .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                                                if let textField = obj.object as? UITextField {
                                                    textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                                                }
                                            }.onChange(of: matrixA.data){ _ in
                                                result.lastOperation = 0
                                                if matrixA.data[row][column] >= result.modulo{
                                                    matrixA.data[row][column] = result.modulo - 1
                                                }
                                            }
                                    }
                                    
                                }
                            }
                        }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(Color(Data.ColorMatrix)))
                    }
                    
                    Group{
                        HStack{
                            VStack{
                                Text("Rows: \(matrixB.rows)").foregroundColor(Color(Data.ColorText)).font(.title2)
                                Slider(value: .convert(from: $matrixB.rows), in: 1...7, step: 1).frame(width: UIScreen.main.bounds.size.width/3.5).accentColor(Color.red).padding(1).overlay(RoundedRectangle(cornerRadius: 3.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton)).onChange(of: matrixB.rows){ _ in
                                    result.lastOperation = 0
                                }
                            }
                            VStack{
                                Text("Columns: \(matrixB.columns)").foregroundColor(Color(Data.ColorText)).font(.title2)
                                Slider(value: .convert(from: $matrixB.columns), in: 1...7, step: 1).frame(width: UIScreen.main.bounds.size.width/3.5).accentColor(Color.green).padding(1).overlay(RoundedRectangle(cornerRadius: 3.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton)).onChange(of: matrixB.columns){ _ in
                                    result.lastOperation = 0
                                }
                            }
                        }
                        HStack{
                            Text("Matrix B:").foregroundColor(Color(Data.ColorText)).font(.title)
                            Button("B\u{1D40}") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                transposeModular(var: matrixB, var: result)
                                
                            }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("B\u{207B}\u{00B9}") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                inverzeModular(var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                        }
                        VStack{
                            ForEach(0...matrixB.rows-1, id: \.self){ row in
                                HStack(spacing: 0){
                                    ForEach(0...matrixB.columns-1, id: \.self){ column in
                                        TextField("\(matrixB.data[row][column])", value: $matrixB.data[row][column], formatter: formatter)
                                            .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/20)).foregroundColor(Color(Data.ColorText))
                                            .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                                                if let textField = obj.object as? UITextField {
                                                    textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                                                }
                                            }.onChange(of: matrixB.data){ _ in
                                                result.lastOperation = 0
                                                if matrixB.data[row][column] >= result.modulo{
                                                    matrixB.data[row][column] = result.modulo - 1
                                                }
                                            }
                                    }
                                    
                                }
                            }
                        }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(Color(Data.ColorMatrix)))
                    }
                    
                    VStack{
                        HStack{
                            Button("A+B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                additionModular(var: matrixA, var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("A\u{00D7}B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                multiplyModular(var: matrixA, var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("[A, B]") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                commutModular(var: matrixA, var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("Res\u{21E5}A") {
                                resToAModular(var: matrixA, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("\u{1F5D1}A") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                matrixA.data = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 7)
                                result.lastOperation = 7
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                        }
                        HStack{
                            Button("A-B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                substractionModular(var: matrixA, var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            
                            Button("B\u{00D7}A") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                multiplyModular(var: matrixB, var: matrixA, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("A\u{21B9}B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                swapMatricesModular(var: matrixA, var: matrixB)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("Res\u{21E5}B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                resToBModular(var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("\u{1F5D1}B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                matrixB.data = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 7)
                                result.lastOperation = 7
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                        }
                    }
                    if result.mistake != "ok"{
                        Text("\(result.mistake)").multilineTextAlignment(.center).foregroundColor(.red)
                    }
                    
                    VStack{
                        ForEach(0..<result.rows, id: \.self){ row in
                            HStack(spacing: 0){
                                ForEach(0..<result.columns, id: \.self){ column in
                                    Text("\(result.data[row][column])")
                                        .font(.system(size: UIScreen.main.bounds.size.width/20)).foregroundColor(Color(Data.ColorText))
                                        .multilineTextAlignment(.center)
                                        .frame(width: UIScreen.main.bounds.size.width/7.2)
                                }
                                
                            }.padding(.bottom, 5.0)
                        }
                    }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(Color(Data.ColorMatrix)))
                    
                    
                    
                    if result.lastOperation != 0 && result.lastOperation != 7{
                        Button("Step-by-Step Solution") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            stepSolution = true
                        }.frame(width: UIScreen.main.bounds.size.width/2).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                    }
                    
                    Spacer()
                    .sheet(isPresented: $stepSolution){
                        if result.lastOperation == 1{
                            AdditionModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular())
                        }
                        if result.lastOperation == 2{
                            SubstractionModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular())
                        }
                        if result.lastOperation == 3 || result.lastOperation == 4{
                            MultiplyModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular())
                        }
                        if result.lastOperation == 8{
                            CommutatorModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular(), result: ResultModular())
                        }
                        if result.lastOperation == 5{
                            InverseModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular(), whatTodo: 1)
                        }
                        if result.lastOperation == 6{
                            InverseModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular(), whatTodo: 2)
                        }
                            
                    }
                    
                }
            }.onAppear{
                result.lastOperation=0
            }
        )
    }
}

struct ModularMatrices_Previews: PreviewProvider {
    static var previews: some View {
        ModularMatrices(matrixA: MatrixAModular(), matrixB: MatrixBModular(), result: ResultModular())
    }
}

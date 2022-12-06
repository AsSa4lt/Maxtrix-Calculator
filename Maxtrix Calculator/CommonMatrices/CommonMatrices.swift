//
//  CommonMatrices.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import SwiftUI

struct CommonMatrices: View {
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumIntegerDigits = 3
        formatter.maximumFractionDigits = 3
        formatter.numberStyle = .decimal
        return formatter
        
    }()
    @StateObject var matrixA: MatrixA
    @StateObject var matrixB: MatrixB
    @StateObject var result: Result
    @StateObject var Data = Design()
    @State var stepSolution: Bool = false
    @AppStorage("inDecimals") var inDecimals: Bool = false
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
            ScrollView{
                VStack{
                    Toggle("Show result in Decimals", isOn: $inDecimals).font(.title2).foregroundColor(Color(Data.ColorText)).frame(width: UIScreen.main.bounds.size.width/1.1)
                    Group{
                        HStack{
                            VStack{
                                Text("Rows: \(matrixA.rows)").foregroundColor(Color(Data.ColorText)).font(.title2)
                                Slider(value: .convert(from: $matrixA.rows), in: 1...7, step: 1).frame(width: UIScreen.main.bounds.size.width/3.5).accentColor(Color.red).padding(1).overlay(RoundedRectangle(cornerRadius: 3.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                                    .onChange(of: matrixA.rows){ _ in
                                    result.lastOpeation = 0
                                }
                            }
                            VStack{
                                Text("Columns: \(matrixA.columns)").foregroundColor(Color(Data.ColorText)).font(.title2)
                                Slider(value: .convert(from: $matrixA.columns), in: 1...7, step: 1).frame(width: UIScreen.main.bounds.size.width/3.5).accentColor(Color.green).padding(1).overlay(RoundedRectangle(cornerRadius: 3.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                                    .onChange(of: matrixA.columns){ _ in
                                    result.lastOpeation = 0
                                }
                            }
                        }
                        HStack{
                            Text("Matrix A:").foregroundColor(Color(Data.ColorText)).font(.title)
                            Button("A\u{1D40}") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                transpose(var: matrixA, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("A\u{207B}\u{00B9}") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                inverze(var: matrixA, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                        }
                        
                        VStack{
                            ForEach(0...matrixA.rows-1, id: \.self){ row in
                                HStack(spacing: 0){
                                    ForEach(0...matrixA.columns-1, id: \.self){ column in
                                        TextField("\(matrixA.data[row][column])", value: $matrixA.data[row][column], formatter: formatter)
                                            .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/22)).foregroundColor(Color(Data.ColorText))
                                            .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                                                if let textField = obj.object as? UITextField {
                                                    textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                                                }
                                            }.onChange(of: matrixA.data){ _ in
                                                result.lastOpeation = 0
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
                                    result.lastOpeation = 0
                                }
                            }
                            VStack{
                                Text("Columns: \(matrixB.columns)").foregroundColor(Color(Data.ColorText)).font(.title2)
                                Slider(value: .convert(from: $matrixB.columns), in: 1...7, step: 1).frame(width: UIScreen.main.bounds.size.width/3.5).accentColor(Color.green).padding(1).overlay(RoundedRectangle(cornerRadius: 3.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton)).onChange(of: matrixB.columns){ _ in
                                    result.lastOpeation = 0
                                }
                            }
                        }
                        HStack{
                            Text("Matrix B:").foregroundColor(Color(Data.ColorText)).font(.title)
                            Button("B\u{1D40}") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                transpose(var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("B\u{207B}\u{00B9}") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                inverze(var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/10).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                        }
                        VStack{
                            ForEach(0...matrixB.rows-1, id: \.self){ row in
                                HStack(spacing: 0){
                                    ForEach(0...matrixB.columns-1, id: \.self){ column in
                                        TextField("\(matrixB.data[row][column])", value: $matrixB.data[row][column], formatter: formatter)
                                            .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/22)).foregroundColor(Color(Data.ColorText))
                                            .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                                                if let textField = obj.object as? UITextField {
                                                    textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                                                }
                                            }.onChange(of: matrixB.data){ _ in
                                                result.lastOpeation = 0
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
                                addition(var: matrixA, var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("A\u{00D7}B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                multipy(var: matrixA, var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("[A, B]") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                commut(var: matrixA, var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("Res\u{21E5}A") {
                                resToA(var: matrixA, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("\u{1F5D1}A") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                matrixA.data = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
                                result.lastOpeation = 7
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                        }
                        HStack{
                            Button("A-B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                substraction(var: matrixA, var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            
                            Button("B\u{00D7}A") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                multipy(var: matrixB, var: matrixA, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("A\u{21B9}B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                swapMatrices(var: matrixA, var: matrixB)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("Res\u{21E5}B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                resToB(var: matrixB, var: result)
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                            Button("\u{1F5D1}B") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                matrixB.data = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
                                result.lastOpeation = 7
                            }.frame(width: UIScreen.main.bounds.size.width/7).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                        }
                    }
                    
                    Text("Result:").foregroundColor(Color(Data.ColorText)).font(.title)
                    if result.mistake != "ok"{
                        Text("\(result.mistake)").multilineTextAlignment(.center).foregroundColor(.red)
                    }
                    
                    if inDecimals == false{
                        VStack{
                            ForEach(0..<result.rows, id: \.self){ row in
                                HStack(spacing: 0){
                                    ForEach(0..<result.columns, id: \.self){ column in
                                        Text("\(rationalApproximationOf(x0 :result.data[row][column]))")
                                            .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/20)).foregroundColor(Color(Data.ColorText))
                                            .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2)
                                    }
                                }.padding(.bottom, 5.0)
                            }
                        }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(Color(Data.ColorMatrix)))
                    }else{
                        VStack{
                            ForEach(0..<result.rows, id: \.self){ row in
                                HStack(spacing: 0){
                                    ForEach(0..<result.columns, id: \.self){ column in
                                        TextField("\(result.data[row][column])", value: $result.data[row][column], formatter: formatter)
                                            .padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/25)).foregroundColor(Color(Data.ColorText))
                                            .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/7.2).onChange(of: matrixB.data){ _ in
                                                result.lastOpeation = 0
                                            }
                                    }
                                    
                                }.padding(.bottom, 5.0)
                            }
                        }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(Color(Data.ColorMatrix)))
                    }
                    
                    
                    
                    if result.lastOpeation != 0 && result.lastOpeation != 7{
                        Button("Step-by-Step Solution") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            stepSolution = true
                        }.frame(width: UIScreen.main.bounds.size.width/2).padding(5).foregroundColor(Color(Data.ColorTextButton)).background(Color(Data.ColorButton)).padding(1).overlay(RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth: 2.0)).foregroundColor(Color(Data.ColorButton))
                    }
                    
                    Spacer()
                        .sheet(isPresented: $stepSolution){
                            if result.lastOpeation == 1{
                                AdditionSheet(matrixA: MatrixA(), matrixB: MatrixB())
                            }
                            if result.lastOpeation == 2{
                                SubstractionSheet(matrixA: MatrixA(), matrixB: MatrixB())
                            }
                            if result.lastOpeation == 3 || result.lastOpeation == 4{
                                MultiplySheet(matrixA: MatrixA(), matrixB: MatrixB())
                            }
                            if result.lastOpeation == 5 && matrixA.rows <= 6{
                                InverzeSheet(countOfSteps: 0, matrixA: MatrixA(), matrixB: MatrixB(), result: Result(), whatTodo: 0)
                            }
                            if result.lastOpeation == 5 && matrixA.rows > 6{
                                SorrySheet()
                            }
                            if result.lastOpeation == 6 && matrixB.rows <= 6{
                                InverzeSheet(countOfSteps: 0, matrixA: MatrixA(), matrixB: MatrixB(), result: Result(), whatTodo: 1)
                            }
                            if result.lastOpeation == 6 && matrixB.rows > 6{
                                SorrySheet()
                            }
                            if result.lastOpeation == 8{
                                CommutatorSheet(matrixA: MatrixA(), matrixB: MatrixB(), result: Result())
                            }
                            
                        }
                }
            }.onAppear{
                result.lastOpeation=0
            }
        )
    }
}

struct CommonMatrices_Previews: PreviewProvider {
    static var previews: some View {
        CommonMatrices(matrixA: MatrixA(), matrixB: MatrixB(), result: Result())
    }
}

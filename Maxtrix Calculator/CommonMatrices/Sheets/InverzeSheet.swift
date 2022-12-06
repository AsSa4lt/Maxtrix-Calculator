//
//  InverzeSheet.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 07.12.2022.
//

import SwiftUI

struct InverzeSheet: View {
    @State var inverzeSteps: [[[Double]]] = [[[0]]]
    @State var inverzeStepsMatrix: [[[Double]]] = [[[0]]]
    @State var steps: [String] = ["loh"]
    @State var countOfSteps: Int = 0
    @StateObject var matrixA: MatrixA
    @StateObject var matrixB: MatrixB
    @StateObject var result: Result
    @StateObject var Data = Design()
    var whatTodo: Int
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
        ScrollView{
            VStack{
                ForEach(0..<countOfSteps, id: \.self){ step in
                    Text("Step \(step+1): \(steps[step])").foregroundColor(Color(Data.ColorText))
                    VStack{
                        ForEach(0..<result.columns, id: \.self){ column in
                            HStack{
                                ForEach(0..<result.rows, id: \.self){ row in
                                    Text("\(rationalApproximationOf(x0: inverzeStepsMatrix[step][column][row]))").padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/35))
                                        .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/18).foregroundColor(Color(Data.ColorText))
                                }
                                Text("|").padding(.horizontal, 0.0).frame(width: UIScreen.main.bounds.size.width/50).foregroundColor(Color(Data.ColorText))
                                ForEach(0..<result.rows, id: \.self){ row in
                                    Text("\(rationalApproximationOf(x0: inverzeSteps[step][column][row]))").padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/35))
                                        .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/18).foregroundColor(Color(Data.ColorText))
                                }
                            }
                        }
                    }.overlay(RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2.0).foregroundColor(Color(Data.ColorMatrix)))
                    .padding(.bottom)
                }
            }
        }.onAppear{
            countOfSteps = 0
            steps = ["loh"]
            inverzeStepsMatrix = [[[0]]]
            inverzeSteps = [[[0]]]
            if whatTodo == 0{
                inverzeA()
            }else{
                inverzeB()
            }
        })
    }
    
    func inverzeA(){
        result.columns=matrixA.columns
        result.rows = matrixA.rows
        result.mistake = "ok"
        var dataMatrix = matrixA.data
        for i in 0..<Result().rows{
            for j in 0..<Result().columns{
                if i==j{
                    result.data[i][j]=1
                }else{
                    result.data[i][j]=0
                }
            }
        }
        inverzeStepsMatrix[0] = dataMatrix
        inverzeSteps[0] = Result().data
        steps[0]="Append a unit matrix"
        countOfSteps+=1
        
        for i in 0..<Result().rows{
            result.lastOpeation = 6
            var k: Int = -1
            if dataMatrix[i][i] == 0{
                for j in i..<Result().rows{
                    if dataMatrix[j][i] != 0{
                        k = j
                        break
                    }
                }
                if k != -1{
                    for j in 0..<result.rows{
                        let bufferMatrix: Double = dataMatrix[i][j]
                        let bufferResult: Double =  result.data[i][j]
                        dataMatrix[i][j] = dataMatrix[k][j]
                        result.data[i][j] =  result.data[k][j]
                        dataMatrix[k][j] = bufferMatrix
                        result.data[k][j] = bufferResult
                    }
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(Result().data)
                    steps.append("Swap rows \(k+1) and \(i+1)")
                    countOfSteps+=1
                }
            }
            let a = dataMatrix[i][i]
            for j in 0..<result.rows{
                let koef = dataMatrix[j][i]/a
                if i != j && koef != 0{
                    for k in 0..<result.rows{
                        dataMatrix[j][k]=dataMatrix[j][k]-dataMatrix[i][k]*koef
                        result.data[j][k] = result.data[j][k] - result.data[i][k]*koef
                    }
                }
                if koef != 0 && i != j {
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(result.data)
                    steps.append("Row \(j+1) - row\(i+1) \u{00D7}\(rationalApproximationOf(x0: koef))")
                    countOfSteps+=1
                }
            }
        }
        
        for i in 0..<Result().rows{
            if dataMatrix[i][i] != 1{
                for j in 0..<Result().rows{
                    result.data[i][j] = result.data[i][j]/dataMatrix[i][i]
                }
                inverzeStepsMatrix.append(dataMatrix)
                inverzeSteps.append(result.data)
                steps.append("Divide row \(i+1) by \(rationalApproximationOf(x0: dataMatrix[i][i]))")
                countOfSteps+=1
                dataMatrix[i][i]=1
            }
        }
        inverzeStepsMatrix.append(dataMatrix)
        inverzeSteps.append(Result().data)
        steps.append("Result")
        countOfSteps+=1
    }
    
    func inverzeB(){
        countOfSteps = 0
        result.columns=matrixB.columns
        result.rows = matrixB.rows
        result.mistake = "ok"
        var dataMatrix = matrixB.data
        for i in 0..<Result().rows{
            for j in 0..<Result().columns{
                if i==j{
                    result.data[i][j]=1
                }else{
                    result.data[i][j]=0
                }
            }
        }
        inverzeStepsMatrix[0] = dataMatrix
        inverzeSteps[0] = Result().data
        steps[0]="Append a unit matrix"
        countOfSteps+=1
        
        for i in 0..<Result().rows{
            result.lastOpeation = 6
            var k: Int = -1
            if dataMatrix[i][i] == 0{
                for j in i..<Result().rows{
                    if dataMatrix[j][i] != 0{
                        k = j
                        break
                    }
                }
                if k != -1{
                    for j in 0..<result.rows{
                        let bufferMatrix: Double = dataMatrix[i][j]
                        let bufferResult: Double =  result.data[i][j]
                        dataMatrix[i][j] = dataMatrix[k][j]
                        result.data[i][j] =  result.data[k][j]
                        dataMatrix[k][j] = bufferMatrix
                        result.data[k][j] = bufferResult
                    }
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(Result().data)
                    steps.append("Swap rows \(k+1) and \(i+1)")
                    countOfSteps+=1
                }
            }
            let a = dataMatrix[i][i]
            for j in 0..<result.rows{
                let koef = dataMatrix[j][i]/a
                if i != j && koef != 0{
                    for k in 0..<result.rows{
                        dataMatrix[j][k]=dataMatrix[j][k]-dataMatrix[i][k]*koef
                        result.data[j][k] = result.data[j][k] - result.data[i][k]*koef
                    }
                }
                if koef != 0 && i != j {
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(result.data)
                    steps.append("Row \(j+1) - row\(i+1) \u{00D7}\(rationalApproximationOf(x0: koef))")
                    countOfSteps+=1
                }
            }
        }
        
        for i in 0..<Result().rows{
            if dataMatrix[i][i] != 1{
                for j in 0..<Result().rows{
                    result.data[i][j] = result.data[i][j]/dataMatrix[i][i]
                }
                inverzeStepsMatrix.append(dataMatrix)
                inverzeSteps.append(result.data)
                steps.append("Divide row \(i+1) by \(rationalApproximationOf(x0: dataMatrix[i][i]))")
                countOfSteps+=1
                dataMatrix[i][i]=1
            }
        }
        inverzeStepsMatrix.append(dataMatrix)
        inverzeSteps.append(Result().data)
        steps.append("Result")
        countOfSteps+=1
    }
}

struct InverzeSheet_Previews: PreviewProvider {
    static var previews: some View {
        InverzeSheet(matrixA: MatrixA(), matrixB: MatrixB(), result: Result(), whatTodo: 0)
    }
}

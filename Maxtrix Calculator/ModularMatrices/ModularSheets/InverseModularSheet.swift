//
//  InverseModularSheet.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import SwiftUI

struct InverseModularSheet: View {
    @State var inverzeSteps: [[[Int]]] = [[[0]]]
    @State var inverzeStepsMatrix: [[[Int]]] = [[[0]]]
    @State var steps: [String] = ["loh"]
    @State var countOfSteps: Int = 0
    @StateObject var matrixA: MatrixAModular
    @StateObject var matrixB: MatrixBModular
    @StateObject var Data = Design()
    var whatTodo: Int
    var body: some View {
        Color(Data.ColorBackgound).edgesIgnoringSafeArea(.vertical).overlay(
        ScrollView{
            VStack{
                ForEach(0..<countOfSteps, id: \.self){ step in
                    Text("Step \(step+1): \(steps[step])").foregroundColor(Color(Data.ColorText))
                    VStack{
                        ForEach(0..<ResultModular().columns, id: \.self){ column in
                            HStack{
                                ForEach(0..<ResultModular().rows, id: \.self){ row in
                                    Text("\(inverzeStepsMatrix[step][column][row])").padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/33))
                                        .multilineTextAlignment(.center).frame(width: UIScreen.main.bounds.size.width/18).foregroundColor(Color(Data.ColorText))
                                }
                                Text("|").padding(.horizontal, 0.0).frame(width: UIScreen.main.bounds.size.width/50).foregroundColor(Color(Data.ColorText))
                                ForEach(0..<ResultModular().rows, id: \.self){ row in
                                    Text("\(inverzeSteps[step][column][row])").padding(.horizontal, 0.0).font(.system(size: UIScreen.main.bounds.size.width/33))
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
            if whatTodo == 1{
                inverzeModular(var: matrixA, var: ResultModular())
            }
            if whatTodo == 2{
                inverzeModular(var: matrixB, var: ResultModular())
            }
        })
    }
    
    func inverzeModular(var matrix: MatrixAModular, var result: ResultModular){
        if matrix.rows == matrix.columns{
            result.columns=matrix.columns
            result.rows = matrix.rows
            result.mistake = "ok"
            var dataMatrix = matrix.data
            for i in 0..<result.rows{
                for j in 0..<result.columns{
                    if i==j{
                        result.data[i][j]=1
                    }else{
                        result.data[i][j]=0
                    }
                }
            }
            inverzeStepsMatrix[0] = dataMatrix
            inverzeSteps[0] = ResultModular().data
            steps[0]="Append a unit matrix"
            countOfSteps+=1
            
            for i in 0..<result.rows{
                result.lastOperation = 5
                var k: Int = -1
                if dataMatrix[i][i] == 0{
                    for j in i..<result.rows{
                        if dataMatrix[j][i] != 0{
                            k = j
                            break
                        }
                    }
                    for j in 0..<result.rows{
                        let bufferMatrix: Int = dataMatrix[i][j]
                        let bufferResult: Int = result.data[i][j]
                        dataMatrix[i][j] = dataMatrix[k][j]
                        result.data[i][j] = result.data[k][j]
                        dataMatrix[k][j] = bufferMatrix
                        result.data[k][j] = bufferResult
                    }
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(ResultModular().data)
                    steps.append("Swap rows \(k+1) and \(i+1)")
                    countOfSteps+=1
                }
                
                var mult1: Int = 1
                if dataMatrix[i][i] != 1 && dataMatrix[i][i] != 0{
                    while ((dataMatrix[i][i]*mult1)%result.modulo) != 1{
                        mult1+=1
                    }
                    for j in 0..<result.rows{
                        dataMatrix[i][j]=dataMatrix[i][j]*mult1
                        dataMatrix[i][j]=dataMatrix[i][j]%result.modulo
                        result.data[i][j]=result.data[i][j]*mult1
                        result.data[i][j]=result.data[i][j]%result.modulo
                    }
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(ResultModular().data)
                    steps.append("Multiply row\(i+1) by \(mult1)")
                    countOfSteps+=1
                }
                
                
                for j in 0..<result.rows{
                    if i != j{
                        var mult2: Int = 1
                        while ((dataMatrix[j][i]*mult2)%result.modulo) != 1 && dataMatrix[j][i] != 0{
                            mult2+=1
                        }
                        for k in 0..<result.rows{
                            dataMatrix[j][k]=dataMatrix[j][k]*mult2
                            dataMatrix[j][k]=dataMatrix[j][k]%result.modulo
                            result.data[j][k]=result.data[j][k]*mult2
                            result.data[j][k]=result.data[j][k]%result.modulo
                        }
                        if mult2 != 1{
                            inverzeStepsMatrix.append(dataMatrix)
                            inverzeSteps.append(ResultModular().data)
                            steps.append("Multiply row\(j+1) by \(mult2)")
                            countOfSteps+=1
                        }
                        if dataMatrix[j][i] != 0{
                            for k in 0..<result.rows{
                                dataMatrix[j][k]=dataMatrix[j][k]-dataMatrix[i][k]
                                result.data[j][k]=result.data[j][k]-result.data[i][k]
                                while dataMatrix[j][k]<0{
                                    dataMatrix[j][k]+=result.modulo
                                }
                                while result.data[j][k]<0{
                                    result.data[j][k]+=result.modulo
                                }
                            }
                            inverzeStepsMatrix.append(dataMatrix)
                            inverzeSteps.append(ResultModular().data)
                            steps.append("Row\(i+1) - row\(j+1)")
                            countOfSteps+=1
                        }
                    }
                }
            }
            for i in 0..<result.rows{
                if dataMatrix[i][i] != 1 && dataMatrix[i][i] != 0{
                    var mult1: Int = 1
                    while (dataMatrix[i][i]*mult1%result.modulo) != 1{
                        mult1+=1
                    }
                    for j in 0..<result.rows{
                        dataMatrix[i][j]=dataMatrix[i][j]*mult1
                        dataMatrix[i][j]=dataMatrix[i][j]%result.modulo
                        result.data[i][j]=result.data[i][j]*mult1
                        result.data[i][j]=result.data[i][j]%result.modulo
                    }
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(ResultModular().data)
                    steps.append("Multiply row\(i+1) by \(mult1)")
                    countOfSteps+=1
                }
                
            }
            
        }else{
            result.rows = 0
            result.columns = 0
            result.mistake = "Count of columns and rows of matrix must be tha same"
            result.lastOperation = 0
        }
    }
    
    func inverzeModular(var matrix: MatrixBModular, var result: ResultModular){
        if matrix.rows == matrix.columns{
            result.columns=matrix.columns
            result.rows = matrix.rows
            result.mistake = "ok"
            var dataMatrix = matrix.data
            for i in 0..<result.rows{
                for j in 0..<result.columns{
                    if i==j{
                        result.data[i][j]=1
                    }else{
                        result.data[i][j]=0
                    }
                }
            }
            inverzeStepsMatrix[0] = dataMatrix
            inverzeSteps[0] = ResultModular().data
            steps[0]="Append a unit matrix"
            countOfSteps+=1
            
            for i in 0..<result.rows{
                result.lastOperation = 5
                var k: Int = -1
                if dataMatrix[i][i] == 0{
                    for j in i..<result.rows{
                        if dataMatrix[j][i] != 0{
                            k = j
                            break
                        }
                    }
                    for j in 0..<result.rows{
                        let bufferMatrix: Int = dataMatrix[i][j]
                        let bufferResult: Int = result.data[i][j]
                        dataMatrix[i][j] = dataMatrix[k][j]
                        result.data[i][j] = result.data[k][j]
                        dataMatrix[k][j] = bufferMatrix
                        result.data[k][j] = bufferResult
                    }
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(ResultModular().data)
                    steps.append("Swap rows \(k+1) and \(i+1)")
                    countOfSteps+=1
                }
                
                var mult1: Int = 1
                if dataMatrix[i][i] != 1 && dataMatrix[i][i] != 0{
                    while ((dataMatrix[i][i]*mult1)%result.modulo) != 1{
                        mult1+=1
                    }
                    for j in 0..<result.rows{
                        dataMatrix[i][j]=dataMatrix[i][j]*mult1
                        dataMatrix[i][j]=dataMatrix[i][j]%result.modulo
                        result.data[i][j]=result.data[i][j]*mult1
                        result.data[i][j]=result.data[i][j]%result.modulo
                    }
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(ResultModular().data)
                    steps.append("Multiply row\(i+1) by \(mult1)")
                    countOfSteps+=1
                }
                
                
                for j in 0..<result.rows{
                    if i != j{
                        var mult2: Int = 1
                        while ((dataMatrix[j][i]*mult2)%result.modulo) != 1 && dataMatrix[j][i] != 0{
                            mult2+=1
                        }
                        for k in 0..<result.rows{
                            dataMatrix[j][k]=dataMatrix[j][k]*mult2
                            dataMatrix[j][k]=dataMatrix[j][k]%result.modulo
                            result.data[j][k]=result.data[j][k]*mult2
                            result.data[j][k]=result.data[j][k]%result.modulo
                        }
                        if mult2 != 1{
                            inverzeStepsMatrix.append(dataMatrix)
                            inverzeSteps.append(ResultModular().data)
                            steps.append("Multiply row\(j+1) by \(mult2)")
                            countOfSteps+=1
                        }
                        if dataMatrix[j][i] != 0{
                            for k in 0..<result.rows{
                                dataMatrix[j][k]=dataMatrix[j][k]-dataMatrix[i][k]
                                result.data[j][k]=result.data[j][k]-result.data[i][k]
                                while dataMatrix[j][k]<0{
                                    dataMatrix[j][k]+=result.modulo
                                }
                                while result.data[j][k]<0{
                                    result.data[j][k]+=result.modulo
                                }
                            }
                            inverzeStepsMatrix.append(dataMatrix)
                            inverzeSteps.append(ResultModular().data)
                            steps.append("Row\(i+1) - row\(j+1)")
                            countOfSteps+=1
                        }
                    }
                }
            }
            for i in 0..<result.rows{
                if dataMatrix[i][i] != 1 && dataMatrix[i][i] != 0{
                    var mult1: Int = 1
                    while (dataMatrix[i][i]*mult1%result.modulo) != 1{
                        mult1+=1
                    }
                    for j in 0..<result.rows{
                        dataMatrix[i][j]=dataMatrix[i][j]*mult1
                        dataMatrix[i][j]=dataMatrix[i][j]%result.modulo
                        result.data[i][j]=result.data[i][j]*mult1
                        result.data[i][j]=result.data[i][j]%result.modulo
                    }
                    inverzeStepsMatrix.append(dataMatrix)
                    inverzeSteps.append(ResultModular().data)
                    steps.append("Multiply row\(i+1) by \(mult1)")
                    countOfSteps+=1
                }
                
            }
            
        }else{
            result.rows = 0
            result.columns = 0
            result.mistake = "Count of columns and rows of matrix must be tha same"
            result.lastOperation = 0
        }
    }
}

struct InverseModularSheet_Previews: PreviewProvider {
    static var previews: some View {
        InverseModularSheet(matrixA: MatrixAModular(), matrixB: MatrixBModular(), whatTodo: 1)
    }
}

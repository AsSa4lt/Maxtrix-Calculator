//
//  InverzeMatrix.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 07.12.2022.
//

import Foundation
func inverze(var matrix: MatrixA, var result: Result){
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
        
        for i in 0..<result.rows{
            result.lastOpeation = 5
            var k: Int = -1
            if dataMatrix[i][i] == 0{
                for j in i..<result.rows{
                    if dataMatrix[j][i] != 0{
                        k = j
                        break
                    }
                }
                if k == -1{
                    loh(var: result)
                    break
                }else{
                    for j in 0..<result.rows{
                        let bufferMatrix: Double = dataMatrix[i][j]
                        let bufferResult: Double = result.data[i][j]
                        dataMatrix[i][j] = dataMatrix[k][j]
                        result.data[i][j] = result.data[k][j]
                        dataMatrix[k][j] = bufferMatrix
                        result.data[k][j] = bufferResult
                    }
                }
            }
            let a = dataMatrix[i][i]
            for j in 0..<result.rows{
                let koef = dataMatrix[j][i]/a
                if i != j{
                    for k in 0..<result.rows{
                        dataMatrix[j][k]=dataMatrix[j][k]-dataMatrix[i][k]*koef
                        result.data[j][k]=result.data[j][k]-result.data[i][k]*koef
                    }
                }
            }
        }
        
        for i in 0..<result.rows{
            if dataMatrix[i][i] != 1{
                for j in 0..<result.rows{
                    result.data[i][j]=result.data[i][j]/dataMatrix[i][i]
                }
                dataMatrix[i][i]=1
            }
        }
        
    }else{
        result.rows = 0
        result.columns = 0
        result.mistake = "Count of columns and rows of matrix must be tha same"
        result.lastOpeation = 0
    }
}

func inverze(var matrix: MatrixB, var result: Result){
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
        
        for i in 0..<result.rows{
            result.lastOpeation = 6
            var k: Int = -1
            if dataMatrix[i][i] == 0{
                for j in i..<result.rows{
                    if dataMatrix[j][i] != 0{
                        k = j
                        break
                    }
                }
                if k == -1{
                    loh(var: result)
                    break
                }else{
                    for j in 0..<result.rows{
                        let bufferMatrix: Double = dataMatrix[i][j]
                        let bufferResult: Double = result.data[i][j]
                        dataMatrix[i][j] = dataMatrix[k][j]
                        result.data[i][j] = result.data[k][j]
                        dataMatrix[k][j] = bufferMatrix
                        result.data[k][j] = bufferResult
                    }
                }
            }
            let a = dataMatrix[i][i]
            for j in 0..<result.rows{
                let koef = dataMatrix[j][i]/a
                if i != j{
                    for k in 0..<result.rows{
                        dataMatrix[j][k]=dataMatrix[j][k]-dataMatrix[i][k]*koef
                        result.data[j][k]=result.data[j][k]-result.data[i][k]*koef
                    }
                }
            }
        }
        
        for i in 0..<result.rows{
            if dataMatrix[i][i] != 1{
                for j in 0..<result.rows{
                    result.data[i][j]=result.data[i][j]/dataMatrix[i][i]
                }
                dataMatrix[i][i]=1
            }
        }
        
    }else{
        result.rows = 0
        result.columns = 0
        result.mistake = "Count of columns and rows of matrix must be tha same"
        result.lastOpeation = 0
    }
}

func loh(var result: Result){
    for i in 0..<result.rows{
        for j in 0..<result.rows{
            result.data[i][j]=0
        }
    }
    result.rows = 0
    result.columns = 0
    result.mistake = "Impossible to solve"
    result.lastOpeation = 0
}

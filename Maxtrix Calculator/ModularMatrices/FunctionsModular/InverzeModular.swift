//
//  InverzeModular.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import Foundation
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
                if k == -1{
                    lohModular(var: result)
                    break
                }else{
                    for j in 0..<result.rows{
                        let bufferMatrix: Int = dataMatrix[i][j]
                        let bufferResult: Int = result.data[i][j]
                        dataMatrix[i][j] = dataMatrix[k][j]
                        result.data[i][j] = result.data[k][j]
                        dataMatrix[k][j] = bufferMatrix
                        result.data[k][j] = bufferResult
                    }
                }
            }
            
            var mult1: Int = 1
            if dataMatrix[i][i] != 1 && dataMatrix[i][i] != 0{
                while (dataMatrix[i][i]*mult1%result.modulo) != 1{
                    mult1+=1
                    print("\(mult1)")
                }
                for j in 0..<result.rows{
                    dataMatrix[i][j]=dataMatrix[i][j]*mult1
                    dataMatrix[i][j]=dataMatrix[i][j]%result.modulo
                    result.data[i][j]=result.data[i][j]*mult1
                    result.data[i][j]=result.data[i][j]%result.modulo
                }
            }
            
            
            for j in 0..<result.rows{
                if i != j{
                    var mult2: Int = 1
                    while (dataMatrix[j][i]*mult2%result.modulo) != 1 && dataMatrix[j][i] != 0{
                        mult2+=1
                        print("\(mult2)")
                    }
                    for k in 0..<result.rows{
                        dataMatrix[j][k]=dataMatrix[j][k]*mult2
                        dataMatrix[j][k]=dataMatrix[j][k]%result.modulo
                        result.data[j][k]=result.data[j][k]*mult2
                        result.data[j][k]=result.data[j][k]%result.modulo
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
        
        for i in 0..<result.rows{
            result.lastOperation = 6
            var k: Int = -1
            if dataMatrix[i][i] == 0{
                for j in i..<result.rows{
                    if dataMatrix[j][i] != 0{
                        k = j
                        break
                    }
                }
                if k == -1{
                    lohModular(var: result)
                    break
                }else{
                    for j in 0..<result.rows{
                        let bufferMatrix: Int = dataMatrix[i][j]
                        let bufferResult: Int = result.data[i][j]
                        dataMatrix[i][j] = dataMatrix[k][j]
                        result.data[i][j] = result.data[k][j]
                        dataMatrix[k][j] = bufferMatrix
                        result.data[k][j] = bufferResult
                    }
                }
            }
            
            var mult1: Int = 1
            if dataMatrix[i][i] != 1 && dataMatrix[i][i] != 0{
                while (dataMatrix[i][i]*mult1%result.modulo) != 1{
                    mult1+=1
                    print("\(mult1)")
                }
                for j in 0..<result.rows{
                    dataMatrix[i][j]=dataMatrix[i][j]*mult1
                    dataMatrix[i][j]=dataMatrix[i][j]%result.modulo
                    result.data[i][j]=result.data[i][j]*mult1
                    result.data[i][j]=result.data[i][j]%result.modulo
                }
            }
            
            
            for j in 0..<result.rows{
                if i != j{
                    var mult2: Int = 1
                    while (dataMatrix[j][i]*mult2%result.modulo) != 1 && dataMatrix[j][i] != 0{
                        mult2+=1
                        print("\(mult2)")
                    }
                    for k in 0..<result.rows{
                        dataMatrix[j][k]=dataMatrix[j][k]*mult2
                        dataMatrix[j][k]=dataMatrix[j][k]%result.modulo
                        result.data[j][k]=result.data[j][k]*mult2
                        result.data[j][k]=result.data[j][k]%result.modulo
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
            }
        }

        
    }else{
        result.rows = 0
        result.columns = 0
        result.mistake = "Count of columns and rows of matrix must be tha same"
        result.lastOperation = 0
    }
}
func lohModular(var result: ResultModular){
    for i in 0..<result.rows{
        for j in 0..<result.rows{
            result.data[i][j]=0
        }
    }
    result.rows = 0
    result.columns = 0
    result.mistake = "Impossible to solve"
    result.lastOperation = 0
}

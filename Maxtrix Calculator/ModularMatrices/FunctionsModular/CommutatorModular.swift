//
//  CommutatorModular.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import Foundation
func commutModular(var matrix1: MatrixAModular, var matrix2: MatrixBModular, var result: ResultModular){
    if matrix1.columns == matrix1.rows && matrix1.rows == matrix2.rows && matrix2.rows == matrix2.columns{
        multiplyModular(var: matrix1, var: matrix2, var: result)
        var data1 = result.data
        multiplyModular(var: matrix2, var: matrix1, var: result)
        var data2 = result.data
        result.lastOperation = 8
        for i in 0..<result.rows{
            for j in 0..<result.columns{
                result.data[i][j]=data1[i][j]-data2[i][j]
                while result.data[i][j]<0{
                    result.data[i][j]+=result.modulo
                }
                result.data[i][j]=result.data[i][j]%result.modulo
            }
        }
    }else{
        result.mistake = "Count of columns and rows of both matrix must be the same"
        result.lastOperation = 0
        result.rows = 0
        result.columns = 0
    }
}

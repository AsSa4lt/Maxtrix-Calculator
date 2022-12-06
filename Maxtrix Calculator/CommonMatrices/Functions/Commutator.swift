//
//  Commutator.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 07.12.2022.
//

import Foundation

func commut(var matrix1: MatrixA, var matrix2: MatrixB, var result: Result){
    if matrix1.columns == matrix1.rows && matrix1.rows == matrix2.rows && matrix2.rows == matrix2.columns{
        multipy(var: matrix1, var: matrix2, var: result)
        var data1 = result.data
        multipy(var: matrix2, var: matrix1, var: result)
        var data2 = result.data
        result.lastOpeation = 8
        for i in 0..<result.rows{
            for j in 0..<result.columns{
                result.data[i][j]=data1[i][j]-data2[i][j]
            }
        }
    }else{
        result.mistake = "Count of columns and rows of both matrix must be the same"
        result.lastOpeation = 0
        result.rows = 0
        result.columns = 0
    }
}

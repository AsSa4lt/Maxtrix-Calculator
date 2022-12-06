//
//  AdditionAndSubstraction.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import Foundation

func addition(var matrix1: MatrixA, var matrix2: MatrixB, var result: Result){
    if matrix1.rows == matrix2.rows && matrix1.columns == matrix2.columns{
        result.mistake = "ok"
        result.lastOpeation = 1
        result.columns = matrix1.columns
        result.rows = matrix1.rows
        for i in 0..<matrix1.rows{
            for j in 0..<matrix1.columns{
                result.data[i][j]=matrix1.data[i][j]+matrix2.data[i][j]
            }
        }
    }else{
        result.mistake = "Count of columns and rows must be the same in both matrices"
        result.lastOpeation = 0
        result.rows = 0
        result.columns = 0
    }
}

func substraction(var matrix1: MatrixA, var matrix2: MatrixB, var result: Result){
    if matrix1.rows == matrix2.rows && matrix1.columns == matrix2.columns{
        result.mistake = "ok"
        result.lastOpeation = 2
        result.columns = matrix1.columns
        result.rows = matrix1.rows
        for i in 0..<matrix1.rows{
            for j in 0..<matrix1.columns{
                result.data[i][j]=matrix1.data[i][j]-matrix2.data[i][j]
            }
        }
    }else{
        result.mistake = "Count of columns and rows must be the same in both matrices"
        result.lastOpeation = 0
        result.rows = 0
        result.columns = 0
    }
}

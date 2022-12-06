//
//  AdditionAndSubstractionModular.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import Foundation
func additionModular(var matrix1: MatrixAModular, var matrix2: MatrixBModular, var result: ResultModular){
    if matrix1.rows == matrix2.rows && matrix1.columns == matrix2.columns{
        result.mistake = "ok"
        result.lastOperation = 1
        result.columns = matrix1.columns
        result.rows = matrix1.rows
        for i in 0..<matrix1.rows{
            for j in 0..<matrix1.columns{
                result.data[i][j]=matrix1.data[i][j]+matrix2.data[i][j]
                result.data[i][j]=result.data[i][j]%result.modulo
            }
        }
    }else{
        result.mistake = "Count of columns and rows must be the same in both matrices"
        result.lastOperation = 0
        result.rows = 0
        result.columns = 0
    }
}

func substractionModular(var matrix1: MatrixAModular, var matrix2: MatrixBModular, var result: ResultModular){
    if matrix1.rows == matrix2.rows && matrix1.columns == matrix2.columns{
        result.mistake = "ok"
        result.lastOperation = 2
        result.columns = matrix1.columns
        result.rows = matrix1.rows
        for i in 0..<matrix1.rows{
            for j in 0..<matrix1.columns{
                result.data[i][j]=matrix1.data[i][j]-matrix2.data[i][j]
                while result.data[i][j]<0{
                    result.data[i][j]+=result.modulo                }
                result.data[i][j]=result.data[i][j]%result.modulo
            }
        }
    }else{
        result.mistake = "Count of columns and rows must be the same in both matrices"
        result.lastOperation = 0
        result.rows = 0
        result.columns = 0
    }
}

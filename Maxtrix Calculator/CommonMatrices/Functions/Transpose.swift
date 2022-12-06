//
//  Transpose.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import Foundation

func transpose(var matrix: MatrixA, var result: Result){
    result.rows = matrix.columns
    result.columns = matrix.rows
    result.mistake = "ok"
    result.lastOpeation = 0
    for i in 0..<matrix.rows{
        for j in 0..<matrix.columns{
            result.data[j][i]=matrix.data[i][j]
        }
    }
}

func transpose(var matrix: MatrixB, var result: Result){
    result.rows = matrix.columns
    result.columns = matrix.rows
    result.lastOpeation = 0
    for i in 0..<matrix.rows{
        for j in 0..<matrix.columns{
            result.data[j][i]=matrix.data[i][j]
        }
    }
}

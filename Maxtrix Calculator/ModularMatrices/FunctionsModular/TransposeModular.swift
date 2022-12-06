//
//  TransposeModular.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import Foundation
func transposeModular(var matrix: MatrixAModular, var result: ResultModular){
    result.rows = matrix.columns
    result.columns = matrix.rows
    result.mistake = "ok"
    result.lastOperation = 0
    for i in 0..<matrix.rows{
        for j in 0..<matrix.columns{
            result.data[j][i]=matrix.data[i][j]
        }
    }
}

func transposeModular(var matrix: MatrixBModular, var result: ResultModular){
    result.rows = matrix.columns
    result.columns = matrix.rows
    result.lastOperation = 0
    for i in 0..<matrix.rows{
        for j in 0..<matrix.columns{
            result.data[j][i]=matrix.data[i][j]
        }
    }
}

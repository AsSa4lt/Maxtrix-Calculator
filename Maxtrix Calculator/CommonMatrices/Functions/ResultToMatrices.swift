//
//  ResultToMatrices.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 07.12.2022.
//

import Foundation

func resToA(var matrix: MatrixA, var result: Result){
    matrix.columns = result.columns
    matrix.rows = result.rows
    matrix.data = result.data
}
func resToB(var matrix: MatrixB, var result: Result){
    matrix.columns = result.columns
    matrix.rows = result.rows
    matrix.data = result.data
}

func swapMatrices(var matrixA: MatrixA, var matrixB: MatrixB){
    var bufRow = matrixA.rows
    var bufCol = matrixA.columns
    var bufData = matrixA.data
    matrixA.rows = matrixB.rows
    matrixA.columns = matrixB.columns
    matrixA.data = matrixB.data
    matrixB.rows = bufRow
    matrixB.columns = bufCol
    matrixB.data = bufData
}

//
//  ResultToMatricesModulat.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import Foundation
func resToAModular(var matrix: MatrixAModular, var result: ResultModular){
    matrix.columns = result.columns
    matrix.rows = result.rows
    matrix.data = result.data
}
func resToBModular(var matrix: MatrixBModular, var result: ResultModular){
    matrix.columns = result.columns
    matrix.rows = result.rows
    matrix.data = result.data
}
func swapMatricesModular(var matrixA: MatrixAModular, var matrixB: MatrixBModular){
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

//
//  MultiplyMatrices.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import Foundation

func multipy(var matrix1: MatrixA, var matrix2: MatrixB, var result: Result){
    if matrix1.columns == matrix2.rows{
        result.mistake = "ok"
        result.lastOpeation = 3
        result.rows = matrix1.rows
        result.columns = matrix2.columns
        for i in 0..<Int(matrix1.rows){
            for j in 0..<Int(matrix2.columns){
                result.data[i][j]=0
                for k in 0..<Int(matrix1.columns){
                    result.data[i][j]=matrix1.data[i][k]*matrix2.data[k][j]+result.data[i][j]
                    }
            }
        }
        
    }else{
        result.mistake = "Count of columns of first matrices and count of rows of second matrix"
        result.lastOpeation = 0
        result.rows = 0
        result.columns = 0
    }
}

func multipy(var matrix1: MatrixB, var matrix2: MatrixA, var result: Result){
    if matrix1.columns == matrix2.rows{
        result.mistake = "ok"
        result.lastOpeation = 4
        result.rows = matrix1.rows
        result.columns = matrix2.columns
        for i in 0..<Int(matrix1.rows){
            for j in 0..<Int(matrix2.columns){
                result.data[i][j]=0
                for k in 0..<Int(matrix1.columns){
                    result.data[i][j]=matrix1.data[i][k]*matrix2.data[k][j]+result.data[i][j]
                    }
            }
        }
    }else{
        result.lastOpeation = 0
        result.rows = 0
        result.columns = 0
        result.mistake = "Count of columns of first matrices and count of rows of second matrix"
    }
}

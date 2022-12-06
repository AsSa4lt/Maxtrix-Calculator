//
//  MultiplyModular.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import Foundation
func multiplyModular(var matrix1: MatrixAModular, var matrix2: MatrixBModular, var result: ResultModular){
    if matrix1.columns == matrix2.rows{
        result.mistake = "ok"
        result.lastOperation = 3
        result.rows = matrix1.rows
        result.columns = matrix2.columns
        for i in 0..<Int(matrix1.rows){
            for j in 0..<Int(matrix2.columns){
                result.data[i][j]=0
                for k in 0..<Int(matrix1.columns){
                    result.data[i][j]=matrix1.data[i][k]*matrix2.data[k][j]+result.data[i][j]
                    }
                while result.data[i][j]<0{
                    result.data[i][j]+=result.modulo
                }
                result.data[i][j]=result.data[i][j]%result.modulo
            }
        }
        
    }else{
        result.mistake = "Count of columns of first matrices and count of rows of second matrix"
        result.lastOperation = 0
        result.rows = 0
        result.columns = 0
    }
}

func multiplyModular(var matrix1: MatrixBModular, var matrix2: MatrixAModular, var result: ResultModular){
    if matrix1.columns == matrix2.rows{
        result.mistake = "ok"
        result.lastOperation = 4
        result.rows = matrix1.rows
        result.columns = matrix2.columns
        for i in 0..<Int(matrix1.rows){
            for j in 0..<Int(matrix2.columns){
                result.data[i][j]=0
                for k in 0..<Int(matrix1.columns){
                    result.data[i][j]=matrix1.data[i][k]*matrix2.data[k][j]+result.data[i][j]
                    }
                while result.data[i][j]<0{
                    result.data[i][j]+=result.modulo
                }
                result.data[i][j]=result.data[i][j]%result.modulo
            }
        }
        
    }else{
        result.mistake = "Count of columns of first matrices and count of rows of second matrix"
        result.lastOperation = 0
        result.rows = 0
        result.columns = 0
    }
}

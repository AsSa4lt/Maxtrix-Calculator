//
//  ModularMatricesData.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 08.12.2022.
//

import SwiftUI

import Foundation
import SwiftUI

class MatrixAModular: ObservableObject {
    @AppStorage("rowsAModular") var rows: Int = 3
    @AppStorage("columnsAModular") var columns: Int = 3
    @AppStorage("dataAModular") var data = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 7)
}

class MatrixBModular: ObservableObject {
    @AppStorage("rowsBModular") var rows: Int = 3
    @AppStorage("columnsBModular") var columns: Int = 3
    @AppStorage("dataBModular") var data = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 7)
}

class ResultModular: ObservableObject {
    @AppStorage("rowsResModular") var rows: Int = 3
    @AppStorage("columnsResModular") var columns: Int = 3
    @AppStorage("dataReModulars") var data = [[Int]](repeating: [Int](repeating: 0, count: 7), count: 7)
    @AppStorage("isImpossibleModular") var mistake: String = "ok"
    @AppStorage("lastOperationModular") var lastOperation: Int = 0
    @AppStorage("modulo") var modulo: Int = 5
}

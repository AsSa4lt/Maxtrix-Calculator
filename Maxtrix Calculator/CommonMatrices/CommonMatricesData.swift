//
//  CommonMatricesData.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import Foundation
import SwiftUI

class MatrixA: ObservableObject {
    @AppStorage("rowsA") var rows: Int = 3
    @AppStorage("columnsA") var columns: Int = 3
    @AppStorage("dataA") var data = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
}

class MatrixB: ObservableObject {
    @AppStorage("rowsB") var rows: Int = 3
    @AppStorage("columnsB") var columns: Int = 3
    @AppStorage("dataB") var data = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
}

class Result: ObservableObject {
    @AppStorage("rowsRes") var rows: Int = 3
    @AppStorage("columnsRes") var columns: Int = 3
    @AppStorage("dataRes") var data = [[Double]](repeating: [Double](repeating: 0, count: 7), count: 7)
    @AppStorage("isImpossible") var mistake: String = "ok"
    @AppStorage("lastOperation") var lastOpeation: Int = 0
}

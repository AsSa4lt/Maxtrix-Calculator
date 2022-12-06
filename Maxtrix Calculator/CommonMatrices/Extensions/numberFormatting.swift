//
//  numberFormatting.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 06.12.2022.
//

import Foundation
func forTrailingZero(temp: Double) -> String {
    var tempVar = String(format: "%g", temp)
    return tempVar
}

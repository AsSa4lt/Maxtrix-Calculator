//
//  Format to fractions.swift
//  Maxtrix Calculator
//
//  Created by Rostyslav on 07.12.2022.
//

import Foundation
typealias Rational = (num : Int, den : Int)

func rationalApproximationOf(x0 : Double, withPrecision eps : Double = 1.0E-5) -> String {
    var x = x0
    var a = x.rounded(.down)
    if a.isNaN{
        a = 0
    }
    var (h1, k1, h, k) = (1, 0, Int(a), 1)
    
    while x - a > eps * Double(k) * Double(k) {
        x = 1.0/(x - a)
        a = x.rounded(.down)
        (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
    }
    if h == 0{
        return("0")
    }
    if k == 1{
        return("\(h)")
    }
    return ("\(h)/\(k)")
}



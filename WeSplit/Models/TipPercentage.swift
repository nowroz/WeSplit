//
//  TipPercentage.swift
//  WeSplit
//
//  Created by Nowroz Islam on 29/10/23.
//

import Foundation

enum TipPercentage: Double, CaseIterable {
    case ten = 0.10
    case fifteen = 0.15
    case twenty = 0.20
    case twentyFive = 0.25
    case zero = 0.00
}

extension TipPercentage: Identifiable {
    var id: Double {
        self.rawValue
    }
}

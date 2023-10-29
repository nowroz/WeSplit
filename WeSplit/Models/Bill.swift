//
//  Bill.swift
//  WeSplit
//
//  Created by Nowroz Islam on 29/10/23.
//

import Foundation

@Observable
final class Bill {
    var checkAmount: Double
    var numOfPeople: Int
    var tipPercentage: Double
    
    init(checkAmount: Double = 0, numOfPeople: Int = 2, tipPercentage: Double = TipPercentage.fifteen.rawValue) {
        self.checkAmount = checkAmount
        self.numOfPeople = numOfPeople
        self.tipPercentage = tipPercentage
    }
}

extension Bill {
    var totalAmount: Double {
        checkAmount * (1 + tipPercentage)
    }
    
    var amountPerPerson: Double {
        totalAmount / Double(numOfPeople)
    }
}

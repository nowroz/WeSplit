//
//  ContentView.swift
//  WeSplit
//
//  Created by Nowroz Islam on 29/10/23.
//

import SwiftUI

struct ContentView: View {
    @Bindable var bill: Bill = Bill()
    @FocusState private var amountIsFocused: Bool
    
    let currencyCode: String = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $bill.checkAmount, format: .currency(code: currencyCode))
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $bill.numOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $bill.tipPercentage) {
                        ForEach(TipPercentage.allCases) {
                            Text($0.rawValue, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    LabeledContent("Total Bill") {
                        Text(bill.totalBill, format: .currency(code: currencyCode))
                            .foregroundStyle(
                                bill.tipPercentage == .zero
                                ? .red
                                : .secondary
                            )
                    }
                    
                    LabeledContent("Amount Per Person") {
                        Text(bill.amountPerPerson, format: .currency(code: currencyCode))
                    }
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview("WeSplit") {
    ContentView()
}

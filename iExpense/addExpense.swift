//
//  addExpense.swift
//  iExpense
//
//  Created by Arthur Sh on 22.11.2022.
//

import SwiftUI

struct addExpense: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @State private var prefferedCurrency = "USD"
    
    @State private var accounts = ["Personal", "Business"]
    @State private var currencies = ["GBP", "USD", "EUR", "WON", "LKR"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(accounts, id: \.self){
                        Text($0)
                    }
                }
                
                Picker("Select your currency", selection: $prefferedCurrency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: prefferedCurrency))
                    .keyboardType(.decimalPad)
                
                
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button("Save"){
                    let newExpense = ExpenseItems(name: name, type: type, amount: amount)
                    if newExpense.type == "Personal"{
                        expenses.itemsPersonal.append(newExpense)
                    } else {
                        expenses.itemsBusiness.append(newExpense)
                    }
                   
                    
                    dismiss()
                }
            }
        }
    }
}

struct addExpense_Previews: PreviewProvider {
    static var previews: some View {
        addExpense(expenses: Expenses())
    }
}

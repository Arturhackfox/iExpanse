//
//  ExpenseItems.swift
//  iExpense
//
//  Created by Arthur Sh on 21.11.2022.
//

import Foundation


struct ExpenseItems: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

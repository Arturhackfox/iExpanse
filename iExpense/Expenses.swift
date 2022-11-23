//
//  Expenses.swift
//  iExpense
//
//  Created by Arthur Sh on 21.11.2022.
//

import Foundation


class Expenses: ObservableObject {
    
    var personalItem: [ExpenseItems] {
        get { items.filter{ $0.type == "Personal"} }
        set { }
    }
    
    var businessItem: [ExpenseItems] {
        get { items.filter{ $0.type == "Business"}}
        set { }
    }
    
    @Published var items = [ExpenseItems](){
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
             
        }
    }
    
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedData = try? JSONDecoder().decode([ExpenseItems].self, from: savedItems){
                items = decodedData
                return
            }
        }

        items = []
    
    }
    

    
}

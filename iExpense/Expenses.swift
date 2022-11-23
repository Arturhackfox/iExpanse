//
//  Expenses.swift
//  iExpense
//
//  Created by Arthur Sh on 21.11.2022.
//

import Foundation


class Expenses: ObservableObject {
    @Published var itemsPersonal = [ExpenseItems](){
        didSet{
            if let encoded = try? JSONEncoder().encode(itemsPersonal){
                UserDefaults.standard.set(encoded, forKey: "ItemsP")
            }
             
        }
    }
    
    @Published var itemsBusiness = [ExpenseItems](){
        didSet{
            if let encoded = try? JSONEncoder().encode(itemsBusiness){
                UserDefaults.standard.set(encoded, forKey: "ItemsB")
            }
             
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "ItemsP"){
            if let decodedData = try? JSONDecoder().decode([ExpenseItems].self, from: savedItems){
                itemsPersonal = decodedData
                return
            }
        }
        
        if let savedItems = UserDefaults.standard.data(forKey: "ItemsB"){
            if let decodedData = try? JSONDecoder().decode([ExpenseItems].self, from: savedItems){
                itemsBusiness = decodedData
            }
        }
        itemsPersonal = []
        itemsBusiness = []
    }
    

    
}

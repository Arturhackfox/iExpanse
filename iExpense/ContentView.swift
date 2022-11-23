//
//  ContentView.swift
//  iExpense
//
//  Created by Arthur Sh on 21.11.2022.
//

import SwiftUI



struct ContentView: View {
    
    @StateObject private var expenses = Expenses()
    
    @State private var isShowingAddExpenses = false
    
    var body: some View {
        
        NavigationStack{
            List{
                Section("Personal"){
                    ForEach(expenses.itemsPersonal){ item in
                        HStack{
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            
                            Text(item.amount, format: .currency(code: "USD"))
                                .font(item.amount < 10 ? .subheadline : .headline)
                                .foregroundColor(item.amount >= 100 ? .red : .primary)
                        }
                    }
                    .onDelete(perform: removeRowsPersonal)
                }
                
                
                    Section("Business"){
                        ForEach(expenses.itemsBusiness){ item in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: "USD"))
                                    .font(item.amount < 10 ? .subheadline : .headline)
                                    .foregroundColor(item.amount >= 100 ? .red : .primary)
                            }
                            
                        }
                        .onDelete(perform: removeRowsBusiness)
                    }
 
                
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                  isShowingAddExpenses = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isShowingAddExpenses) {
                    addExpense(expenses: expenses)
                }
            }
        }
        
    }
    
    func removeRowsPersonal(for index: IndexSet){
        expenses.itemsPersonal.remove(atOffsets: index)
    }
    
    func removeRowsBusiness(for index: IndexSet){
        expenses.itemsBusiness.remove(atOffsets: index)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

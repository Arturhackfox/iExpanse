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
                    ForEach(expenses.personalItem){ item in
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
                    .onDelete(perform: removePersonalItems)
                }
                
                
                    Section("Business"){
                        ForEach(expenses.businessItem){ item in
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
                        .onDelete(perform: removeBusinessItems)
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
    
    func removePersonalItems(at offsets: IndexSet) {
        for item in offsets {
            if let index = expenses.items.firstIndex(where: {$0.id == expenses.personalItem[item].id}) {
                expenses.items.remove(at: index)
            }
        }
      }
  
    func removeBusinessItems (at offsets: IndexSet) {
        for i in offsets {
            if let index = expenses.items.firstIndex(where: {$0.id == expenses.businessItem[i].id}){
                expenses.items.remove(at: index)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

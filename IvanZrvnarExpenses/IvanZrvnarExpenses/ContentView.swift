//
//  ContentView.swift
//  IvanZrvnarExpenses
//
//  Created by Ivan Zrvnar on 2022-06-28.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @StateObject var expenses = ExpenseStore()
    @State private var showingAddExpense = false
    
    
    
    var body: some View {
        
        NavigationView{
            List{
                ForEach(expenses.items){
                    item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                
                
                .onDelete(perform: removeItems)
                
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button{
                  showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
       

        
        
    }//: Body
    
    //MARK: - Methods
    
    // method to remove item at selected index
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    

    
}//: Content View

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

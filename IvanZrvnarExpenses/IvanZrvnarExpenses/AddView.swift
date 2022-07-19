//
//  AddView.swift
//  IvanZrvnarExpenses
//
//  Created by Ivan Zrvnar on 2022-06-28.
//

import SwiftUI

struct AddView: View {
    //MARK: Properties
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    // passing the expense store from one view to another
    @ObservedObject var expenses: ExpenseStore
    
    //dismissing the addview
    @Environment (\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
      
        
    }//: Body
}//: View

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: ExpenseStore())
    }
}

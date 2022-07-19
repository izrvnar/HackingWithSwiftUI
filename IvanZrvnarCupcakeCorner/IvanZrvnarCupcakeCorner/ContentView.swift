//
//  ContentView.swift
//  IvanZrvnarCupcakeCorner
//
//  Created by Ivan Zrvnar on 2022-07-04.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    @StateObject var order = Order()
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices){
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)" , value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Any Special Requests", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section{
                    NavigationLink{
                        AddressView(order: order)
                    }label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("CupcakeCorner")
        }
        
        
        
        
    }//: body
}//: content view 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

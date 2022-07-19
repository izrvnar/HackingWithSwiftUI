//
//  CheckoutView.swift
//  IvanZrvnarCupcakeCorner
//
//  Created by Ivan Zrvnar on 2022-07-04.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showConfirmationMessage = false
    
    
    var body: some View {
        
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){
                    image in image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {
                    Task{
                        await placeOrder()
                    }
                })
                .padding()
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Thank You", isPresented: $showConfirmationMessage){
            Button("OK"){}
        } message: {
            Text(confirmationMessage)
        }
        
        
        
        
    }//: body
    
    // MARK: Methods
    func placeOrder() async{
        // convert current order object to JSON that can be sent
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do{
            let(data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodeOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodeOrder.quantity)x \(Order.types[decodeOrder.type].lowercased()) cupcakes is on its way"
            showConfirmationMessage = true

        }catch{
            print("Checkout Failed")
        }
        
        
        
        
    }//: place order()
    
}//: checkoutView

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}

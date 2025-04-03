//
//  CheckoutView.swift
//  ToDoList
//
//  Created by Kannan Prasad on 02/04/2025.
//

import SwiftUI

struct CheckoutView: View {
    
    @Environment(Order.self) private var order
    
    let paymentTypes = ["Cash", "Card", "Rewars Points"]
    @State private var paymentMode = "Cash"
    @State private var addRewardsDetails = false
    @State private var rewardsCardNumber = ""
    
    let tipAmounts =  [0,10, 15, 20, 25]
    @State private var selectedTipAmount = 15
    
    var grandTotal: String {
        let total = Decimal(order.total)
        let grandTotal = total + (total * Decimal(selectedTipAmount))/100
        
        return grandTotal.formatted(.currency(code: "GBP"))
    }
       
    
    @State private var isShowingPaymentAlert = false
    
    var body: some View {
        Form {
            Section{
                Picker("How you want to pay", selection: $paymentMode) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle(isOn: $addRewardsDetails.animation()) {
                    Text("Add Rewards card")
                }
                
                if addRewardsDetails {
                    TextField("Enter Rewards card number", text: $rewardsCardNumber)
                }
            }
            
            Section("Add Tip ?") {
                Picker("Select % ", selection: $selectedTipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0) %")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Title:\(grandTotal)") {
                Button("Confirm Order"){
                    isShowingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(" Order Placed", isPresented: $isShowingPaymentAlert) {
            
        } message: {
            Text("Your Order total is \(grandTotal)")
        }


    }
}

#Preview {
    CheckoutView()
        .environment(Order())
}

//
//  OrderView.swift
//  ToDoList
//
//  Created by Kannan Prasad on 02/04/2025.
//

import SwiftUI

struct OrderView: View {
    
    @Environment(Order.self) private var order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("£ \(item.price)")
                        }
                        
                    }.onDelete { index in
                        deleteItem(offSet: index)
                    }
                }
                Section {
                    NavigationLink("Proceed to checkout") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }.navigationTitle("Order")
             .navigationBarTitleDisplayMode(.large)
             .toolbar{
                 EditButton()
             }
        }
        
    }
    
   private func deleteItem(offSet: IndexSet) {
        order.items.remove(atOffsets: offSet)
    }
    
}

#Preview {
    OrderView()
        .environment(Order())
}

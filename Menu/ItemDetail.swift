//
//  ItemDetail.swift
//  ToDoList
//
//  Created by Kannan Prasad on 02/04/2025.
//

import SwiftUI

struct ItemDetail: View {
    
    @Environment(Order.self) private var order
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
                .overlay(alignment:.bottomTrailing) {
                    Text("Photo: \(item.photoCredit)")
                        .padding(5)
                        .background(.black)
                        .foregroundStyle(.white)
                        .offset(x: -5, y: -5)
                    
                }
            Text(item.description)
                .padding()
            
            Button("Order") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environment(Order())
    }
    
}

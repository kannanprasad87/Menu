//
//  ItemRow.swift
//  ToDoList
//
//  Created by Kannan Prasad on 02/04/2025.
//

import SwiftUI

struct ItemRow: View {
    
    let item: MenuItem
    
    let colors: [String: Color] = ["D": .purple,
                                   "G": .black,
                                   "N": .brown,
                                   "S": .blue,
                                   "V": .green]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.green, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("£\(item.price)")
                    .font(.subheadline)
            }
            Spacer()
            ForEach (item.restrictions, id: \.self) { code in
                Text(code)
                    .font(.caption)
                    .fontWeight(.heavy)
                    .padding(5)
                    .background(colors[code])
                    .foregroundStyle(.white)
                    .clipShape(Circle())
            }

        }
    }
}

#Preview {
    ItemRow(item: MenuItem.example)
}

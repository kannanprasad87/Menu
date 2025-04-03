//
//  MainView.swift
//  ToDoList
//
//  Created by Kannan Prasad on 02/04/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Tab("Menu", systemImage: "list.bullet") {
                ContentView()
            }
            
            Tab("Order", systemImage: "square.and.pencil") {
                OrderView()
            }
        }
    }
}

#Preview {
    MainView()
        .environment(Order())
}

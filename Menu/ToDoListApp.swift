//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kannan Prasad on 02/04/2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @State var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(order)
        }
    }
}

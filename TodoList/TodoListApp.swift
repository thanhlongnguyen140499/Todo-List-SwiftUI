//
//  TodoListApp.swift
//  TodoList
//
//  Created by Edward Nguyen on 12/5/24.
//

import SwiftUI

/* MVVM Architecture
 
 Model - data point
 View - UI
 ViewModal - manages Models for View
 
*/

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}

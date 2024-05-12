//
//  ListView.swift
//  TodoList
//
//  Created by Edward Nguyen on 12/5/24.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = [
        "This is the first title!",
        "This is the second!",
        "Third"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar(content: {
            ToolbarItem(placement: ToolbarItemPlacement.topBarLeading, content: {
                NavigationLink {
                    
                } label: {
                    Text("Edit")
                }
            })
            
            
            ToolbarItemGroup(placement: .topBarTrailing, content: {
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add")
                }
            })
        })
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}

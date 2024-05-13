//
//  ListView.swift
//  TodoList
//
//  Created by Edward Nguyen on 12/5/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture(perform: {
                                withAnimation(.snappy) {
                                    listViewModel.updateItem(item: item)
                                }
                            })
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
            
        }
        .navigationTitle("Todo List 📝")
        .toolbar(content: {
            ToolbarItemGroup(placement: ToolbarItemPlacement.topBarLeading, content: {
                if !listViewModel.items.isEmpty {
                    EditButton()
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
            .environmentObject(ListViewModel())
    }
}

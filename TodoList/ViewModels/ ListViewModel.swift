//
//   ListViewModel.swift
//  TodoList
//
//  Created by Edward Nguyen on 13/5/24.
//

import Foundation

/*
    CRUD Functions in here
 */

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init (){
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title", isCompleted: false),
            ItemModel(title: "Get Up", isCompleted: true),
            ItemModel(title: "Work", isCompleted: true),
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet)  {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(indexSet: IndexSet, newOffSet: Int) {
        items.move(fromOffsets: indexSet, toOffset: newOffSet)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { itemModel in
            itemModel.id == item.id
        }) {
            items[index] =  item.updateCompletion()
        }
    }
}

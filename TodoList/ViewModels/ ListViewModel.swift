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
    
    @Published var items: [ItemModel] = [] {
        // this array changes then didSet will be excused
        didSet {
            saveLocalItems()
        }
    }
    let storageKey = "SwiftUIStorageKey"
    
    init (){
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        
        items.append(contentsOf: savedItems)
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
    
    func saveLocalItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: storageKey)
        }
    }
}

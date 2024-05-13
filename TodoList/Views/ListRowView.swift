//
//  ListRowView.swift
//  TodoList
//
//  Created by Edward Nguyen on 12/5/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
                .strikethrough(item.isCompleted)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
        
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "Hello 1", isCompleted: true))
        ListRowView(item: ItemModel(title: "Hello 1", isCompleted: false))
    }
}

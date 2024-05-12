//
//  AddView.swift
//  TodoList
//
//  Created by Edward Nguyen on 12/5/24.
//

import SwiftUI

struct AddView: View {
    @State var todoText: String = ""
    var body: some View {
        ScrollView {
            TextField("Type your todo...", text: $todoText)
                .padding(.horizontal)
                .frame(height: 50)
                .background(.gray.opacity(0.3))
                .cornerRadius(10)
                .padding(.horizontal)
                
            Button(action: {}, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    
            })
        }
        .navigationTitle("Add an Item 🖋️")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}

//
//  AddView.swift
//  TodoList
//
//  Created by Edward Nguyen on 12/5/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var todoText: String = ""
    @State var showAlert: Bool = false
    @State var alertText: String = ""
    
    var body: some View {
        ScrollView {
            TextField("Type your todo...", text: $todoText)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding(.horizontal)
                
            Button(action: addNewItem, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })
            .alert(isPresented: $showAlert, content: {
                getAlert()
            })
        }
        .navigationTitle("Add an Item 🖋️")
    }
    
    func addNewItem() {
        if textIsAppropriate() {
            listViewModel.addItem(title: todoText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if todoText.count < 3 {
            alertText = "Your todo must be ats least 3 characters 🙈🙉🙊"
            showAlert.toggle()
            
            return false
        } else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("Oops"), message: Text(alertText))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}

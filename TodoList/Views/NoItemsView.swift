//
//  NoItemsView.swift
//  TodoList
//
//  Created by Edward Nguyen on 13/5/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            ScrollView {
                VStack(spacing: 10) {
                    Text("There are no items!")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                        .padding(.bottom, 20)
                
                    NavigationLink {
                        AddView()
                    } label: {
                        Text("Add Something 🙈").padding(animate ? 15 : 25)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .background(animate ? Color.primary : Color.accentColor)
                            .cornerRadius(10)
                            .shadow(radius: 10, x: 0, y: animate ? 15 : 30)
                            .scaleEffect(animate ? 1.1 : 1)
                            .offset(y: animate ? -7 : 0)
                    }
                }
                .onAppear(perform: {
                    addAnimation()
                })
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5, execute: {
            withAnimation(Animation.linear(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        })
    }
}

#Preview {
    NavigationView(content: {
        NoItemsView()
    })
    .navigationTitle("Title")
    
}

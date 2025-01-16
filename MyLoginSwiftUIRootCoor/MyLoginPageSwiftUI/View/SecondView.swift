//
//  SecondView.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/13/24.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            Text("Second View")
            Button("Present 🍋") {
                coordinator.present(sheet: .third)
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button(action: {
                    coordinator.popToRoot()
                }, label: {
                    Text("Pop to root")
                })
            }
        }
    }
    
}

#Preview {
    SecondView()
}

//
//  ThirdView.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/13/24.
//

import SwiftUI

struct ThirdView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var rootManager: RootManager
    
    var body: some View {
        VStack {
            Text("Third View")
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading){
                Button(action: {
                    coordinator.dismissSheet()
                }, label: {
                    Text("Dismiss")
                })
            }
        }
    }
       
}

#Preview {
    ThirdView()
}

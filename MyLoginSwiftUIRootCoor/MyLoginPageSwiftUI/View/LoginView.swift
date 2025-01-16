//
//  ContentView.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/5/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var rootManager: RootManager
    @StateObject var loginViewModel = LoginViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login Please")
                    .font(.largeTitle)
                    .padding(.top, 100)
                    .padding(.bottom, 40)
                HStack {
                    Text("Username")
                        .font(.system(size: 28.0))
                        .padding(.leading, 20)
                    Spacer()
                }
                TextField("Enter your username", text: $username)
                    .background(Color.gray)
                    .padding(.horizontal, 20)
                    .font(.system(size: 28.0))
                HStack {
                    Text("Password")
                        .font(.system(size: 28.0))
                        .padding(.horizontal, 20)
                    Spacer()
                }
                SecureField("Enter your password", text:$password)
                    .background(Color.gray)
                    .padding(.horizontal, 20)
                    .font(.system(size: 28.0))
                
                Button("Login") {
                    //Login
                    Task {
                        try await loginViewModel.loginToServer()
                    }
                    
                }
                .onChange(of: loginViewModel.shouldNavigate) { oldValue, newValue in
                    print("New navigation value is \(newValue)")
                    rootManager.currentRoot = .rootMain
                }
//                .navigationDestination(isPresented: $loginViewModel.shouldNavigate, destination: { HomeView() })
//                .padding(.top, 30)
//                .font(.system(size: 28.0))
//                
//                .padding(.trailing, 20)
            }
            
            Spacer()
                .frame(height:350)
        }
        //.onAppear(perform: loginViewModel.biometricAuthenticate)
         
        }
}

#Preview{
    LoginView()
}

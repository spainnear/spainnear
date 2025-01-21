//
//  ContentView.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/5/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject var loginViewModel = LoginViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var usersFace = UserDefaults.standard.bool(forKey: "UseFaceId")
    @State private var showingAlert = false
    
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
                    appRootManager.currentRoot = .home
                    if newValue == true {
                        UserDefaults.standard.set(true, forKey: "DidLogin")
                    }
                }
                .padding(.top, 30)
                .font(.system(size: 28.0))
                // Toggle, Biometrics
                Toggle(isOn: $usersFace) {
                    Text("Uses Face ID")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onChange(of: usersFace) {
                            if usersFace == true {
                                UserDefaults.standard.set(true, forKey: "UseFaceId")
                                showingAlert = true
                            }
                            UserDefaults.standard.set(usersFace, forKey: "UseFaceId")
                            print("UsesFace \(usersFace)")
                            
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Please Login"), message: Text("Face ID after login"), dismissButton: .default(Text("Got it!")))
                        }
                    
                }
                
                .padding(.trailing, 20)
              
            }
            .font(Font.largeTitle)
            .frame(width: 350, height: 500)
            .padding()
            
            
            Spacer()
        }
        .onAppear(perform: loginViewModel.biometricAuthenticate)
         
        }
    
    
    
    //#Preview {
    //    ContentView(savedFaceId: Environment<Any>.true)
    //
    //}
    
    
}

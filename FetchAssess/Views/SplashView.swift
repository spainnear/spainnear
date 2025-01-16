//
//  ContentView.swift
//  TapNavigation
//
//  Created by James O'Mahoney on 8/17/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State var isShown = false
    @State private var isAnimating = false
    
    var myTitle: AttributedString {
        var result = AttributedString("O'Mahoney Assessment")
        result.font = .largeTitle
        result.foregroundColor = .green
        result.backgroundColor = .white
        return result
        }
    var myUsing: AttributedString {
        var result = AttributedString("Using:")
        result.font = .title
        result.foregroundColor = .green
        result.backgroundColor = .white
        return result
        }
    var mySwiftUI: AttributedString {
        var result = AttributedString("SwiftUI")
        result.font = .title
        result.foregroundColor = .red
        result.backgroundColor = .white
        return result
    }
    var myMVVM: AttributedString {
        var result = AttributedString("MVVM")
        result.font = .title
        result.foregroundColor = .blue
        result.backgroundColor = .white
        return result
    }
    var myAsync: AttributedString {
        var result = AttributedString("Async/Await")
        result.font = .title
        result.foregroundColor = .purple
        result.backgroundColor = .white
        return result
    }
    var myTask: AttributedString {
        var result = AttributedString(".task Modifier")
        result.font = .title
        result.foregroundColor = .brown
        result.backgroundColor = .white
        return result
    }
    var myCore: AttributedString {
        var result = AttributedString("Core Graphics")
        result.font = .title
        result.foregroundColor = .cyan
        result.backgroundColor = .white
        return result
    }
    var myTouch: AttributedString {
        var result = AttributedString("Touch Anywhere to Continue")
        result.font = .title3
        result.foregroundColor = .mint
        result.backgroundColor = .white
        return result
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .foregroundColor(.white.opacity(0.5))
                    .frame(height: 100)
                Text(myTitle)
                    .padding(.top, 10)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -300)
                    .animation(.easeInOut(duration: 5), value: isAnimating)
                Text(myUsing)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: isAnimating ? 0 : 300)
                    .animation(.easeInOut(duration: 5), value: isAnimating)
                Text(mySwiftUI)
                    .padding(.top, 10)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: isAnimating ? 0 : -300)
                    .animation(.easeInOut(duration: 5), value: isAnimating)
                Text(myMVVM)
                    .padding(.top, 5)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: isAnimating ? 0 : 300)
                    .animation(.easeInOut(duration: 5), value: isAnimating)
                Text(myAsync)
                    .padding(.top, 5)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: isAnimating ? 0 : -300)
                    .animation(.easeInOut(duration: 5), value: isAnimating)
                Text(myTask)
                    .padding(.top, 5)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: isAnimating ? 0 : 300)
                    .animation(.easeInOut(duration: 5), value: isAnimating)
                Text(myCore)
                    .padding(.top, 5)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: isAnimating ? 0 : -300)
                    .animation(.easeInOut(duration: 5), value: isAnimating)
                Rectangle()
                    .foregroundColor(.white.opacity(0.5))
                
                Text(myTouch)
                    .padding(.top, 5)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeInOut(duration: 5), value: isAnimating)
                
                NavigationLink("", destination: MealsListView(),
                                    isActive: $isActive)
            }
            .padding()
            .onAppear() {
                isAnimating = true
                
            }
            .onTapGesture {
                isActive.toggle()
            }
        }
    }
    
}

#Preview {
    SplashView()
}

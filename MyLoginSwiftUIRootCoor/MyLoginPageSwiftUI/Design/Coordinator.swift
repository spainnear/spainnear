//
//  Coordinator.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/14/24.
//

import Foundation
import SwiftUI
import Observation

// Screens that we need to navigate
enum Page: String, Identifiable {
    case loginView, firstView, secondView, thirdView
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case second, third
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case third
    
    var id: String {
        self.rawValue
    }
}

// Object that will handle all the navigation
@Observable
class Coordinator: ObservableObject {
    var path = NavigationPath()
    var sheet: Sheet?
    var fullScreenCover: FullScreenCover?

    @ViewBuilder
     func build(page: Page) -> some View {
        switch page {
        case .loginView:
            LoginView()
        case .firstView:
            HomeView()
        case .secondView:
            SecondView()
        case .thirdView:
            ThirdView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .second:
            NavigationStack {
                SecondView()
            }
        case .third:
            NavigationStack {
                ThirdView()
            }
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .third:
            NavigationStack {
                ThirdView()
            }
        }
    }

    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
}

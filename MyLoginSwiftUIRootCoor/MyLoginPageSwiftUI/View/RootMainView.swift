//
//  RootView.swift
//  MyLoginPageSwiftUI
//
//  Created by Seamus O'Mahoney on 4/14/24.
//

import SwiftUI
import Observation

struct RootMainView: View {
    @State private var coordinator = Coordinator()
    @EnvironmentObject private var rootManager: RootManager

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            // Initially show screen1
            coordinator.build(page: .firstView)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.build(fullScreenCover: fullScreenCover)
                }
        }
        // inject object into environment so there is no need to pass to each view
        .environment(coordinator)
    }
}

#Preview {
    RootMainView()
}

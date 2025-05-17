//
//  AppCoordinatorView.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.
import Foundation
import SwiftUI

struct AppCoordinatorView: View {
    @StateObject private var coordinator: AppCoordinator
    @StateObject private var gameViewModel: SettingsViewModel
    
    init(coordinator: AppCoordinator) {
        self._coordinator = StateObject(wrappedValue: coordinator)
        self._gameViewModel = StateObject(wrappedValue: SettingsViewModel(coordinator: coordinator))
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.makeView(pages: .settings)
                .fullScreenCover(item: $coordinator.fullScreenCover) { content in
                    coordinator.makeFullScreen(fullScreen: content)
                }
        }
    }
}

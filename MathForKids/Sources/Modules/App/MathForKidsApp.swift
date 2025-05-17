//
//  ContentView.swift
//  MathForKids

import SwiftUI

struct MathForKidsApp: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        AppCoordinatorView(coordinator: coordinator)
    }
}


//
//  AppCoordinator.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.
import Foundation
import SwiftUI

final class AppCoordinator: AppCoordinatorType {
    // MARK: - Type Alias
    typealias Pages = AppPages
    typealias Sheet = Never
    typealias FullScreenCover = AppFullScreen
    
    // MARK: - Published Properties
    @Published var sheet: Never?
    @Published var path: NavigationPath = NavigationPath()
    @Published var fullScreenCover: AppFullScreen?
    
    // MARK: - Stored Properties
    var parentCoordinator: (any AppCoordinatorType)?
    
    // MARK: - Methods
    func push(page: AppPages) {
        path.append(page)
    }
    
    func presentSheet(_ sheet: Never) {}
    
    func presentFullScreenCover(_ cover: AppFullScreen) {
        self.fullScreenCover = cover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func dismissCover() {
        fullScreenCover = nil
    }
    
    @ViewBuilder
    func makeView(pages: AppPages) -> some View {
        switch pages {
        case .settings:
            let viewModel = SettingsViewModel(coordinator: self)
            Settings(viewModel: viewModel)
        }
    }
    
    @ViewBuilder
    func makeFullScreen(fullScreen: AppFullScreen) -> some View {
        switch fullScreen {
        case .quiz(let quizType, let numberOfQuestions, let maxRange):
            let viewModel: GameViewModel = GameViewModel(
                coordinator: self,
                questionType: quizType,
                numberOfQuestions: numberOfQuestions,
                maxRange: maxRange
            )
            
            Game(viewModel: viewModel)
        }
    }
    
    func makeSheet(sheet: Never) -> some View {
        EmptyView()
    }
}

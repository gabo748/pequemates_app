//
//  AppCoordinatorType.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.
//  Copyright © 2025 Gregory Stark. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - AppCoordinatorType
protocol AppCoordinatorType: ObservableObject, Factory {
    // MARK: - Properties
    var parentCoordinator: (any AppCoordinatorType)? { get set }
    var path: NavigationPath { get set }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }
    
    // MARK: - Methods
    func push(page: Pages)
    func pop()
    func popToRoot()
    func presentSheet(_ sheet: Sheet)
    func presentFullScreenCover(_ cover: FullScreenCover)
    func dismissSheet()
    func dismissCover()
}

// MARK: - Factory
protocol Factory {
    // MARK: - Associated Types
    associatedtype Pages: Hashable
    associatedtype Sheet: Hashable = Never
    associatedtype FullScreenCover: Hashable = Never
    associatedtype Content: View
    associatedtype SheetContent: View
    associatedtype FullScreenContent: View
    
    // MARK: - Methods
    func makeView(pages: Pages) -> Content
    func makeFullScreen(fullScreen: FullScreenCover) -> FullScreenContent
    func makeSheet(sheet: Sheet) -> SheetContent
}

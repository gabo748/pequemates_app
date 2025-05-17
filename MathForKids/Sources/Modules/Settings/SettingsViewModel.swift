//
//  SettingsViewModel.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.
//  Copyright © 2025 Gregory Stark. All rights reserved.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var maxRange = 6
    @Published var numberOfQuestions = 5
    @Published var questionType: QuestionType = .addition
    
    // MARK: - Properties
    private let coordinator: AppCoordinator
    
    // MARK: - Initializer
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Methods
    func presentQuiz() {
        coordinator.fullScreenCover = .quiz(quizType: questionType, numberOfQuestions: numberOfQuestions, maxRange: maxRange)
    }
}

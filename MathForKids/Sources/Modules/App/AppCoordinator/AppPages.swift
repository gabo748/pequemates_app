//
//  AppPages.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.

import Foundation

enum AppPages: Hashable {
    case settings
}

enum AppFullScreen: Hashable, Identifiable {
    case quiz(quizType: QuestionType, numberOfQuestions: Int, maxRange: Int)
    
    var id: Self { return  self }
}

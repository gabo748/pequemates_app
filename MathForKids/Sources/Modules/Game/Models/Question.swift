//
//  Question.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.

import Foundation

struct Question {
    let type: QuestionType
    let firstNumber: Int
    let secondNumber: Int
    
    var correctAnswer: Int {
        switch type {
        case .addition:
            return firstNumber + secondNumber
        case .susbtraction:
            return firstNumber - secondNumber
        case .multiplication:
            return firstNumber * secondNumber
        case .none:
            return 0
        }
    }
    
    init(type: QuestionType, firstNumber: Int, secondNumber: Int) {
        self.type = type
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    init() {
        self.type = .none
        self.firstNumber = 0
        self.secondNumber = 0
    }
}

enum QuestionType: Int {
    case addition = 0
    case susbtraction = 1
    case multiplication = 2
    case none
    
    var sign: String {
        switch self {
        case .addition:
            return "+"
        case .susbtraction:
            return "-"
        case .multiplication:
            return "*"
        case .none:
            return ""
        }
    }
    
}

//
//  GameViewModel+Extension.swift
//  MathForKids
//
//  Created by Gabriel Campos on 6/5/25.

import Foundation

// MARK: - Strings
extension GameViewModel {
    var numberOfQuestionsLeftText: String {
        "\(currentQuestionIndex+1)/\(questions.count)"
    }
    
    var correctAnswersText: String {
        "\(correctAnswers) correctas"
    }
    
    var inCorrectAnswersText: String {
        "\(incorrectAnswers) incorrectas"
    }
    
    var operationQuestionText: String {
        let firstNumber = currentQuestion.firstNumber
        let secondNumber = currentQuestion.secondNumber
        let operationSign = currentQuestion.type.sign
        
        return "\(firstNumber)\(operationSign)\(secondNumber)=?"
    }
    
    var yourAnswerText: String {
        "Tu Respuesta"
    }
    
    var correctAnswerResultText: String {
        "Respuesta Correcta: \(currentQuestion.correctAnswer)"
    }
}

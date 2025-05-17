//
//  GameViewModel.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.

import Foundation

final class GameViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var answer: String = ""
    @Published var currentQuestionIndex: Int = 0
    @Published var correctAnswers: Int = 0
    @Published var incorrectAnswers: Int = 0
    @Published var isSubmitted: Bool = false
    @Published var questions: [Question] = []
    @Published var gameFields: GameFields = GameFields()
    @Published var showQuestionFinishedAlert: Bool = false
    
    // MARK: - Properties
    private let coordinator: AppCoordinator
    private let questionType: QuestionType
    private let maxRange: Int
    let numberOfQuestions: Int
    
    // MARK: - Computed Properties
    var isSubmitEnable: Bool {
        !answer.isEmpty && Int(answer) != nil
    }
    
    var isAnswerCorrect: Bool {
        guard let question = questions[safe: currentQuestionIndex],
              let answer = Int(answer) else { return false }
        
        return question.correctAnswer == answer
    }
    
    var isFinalQuestion: Bool {
        let currentCount = currentQuestionIndex + 1
        
        return questions.count == currentCount
    }
    
    var currentQuestion: Question {
        questions[safe: currentQuestionIndex] ?? Question()
    }
    
    // MARK: - Initiliazer
    init(
        coordinator: AppCoordinator,
        questionType: QuestionType,
        numberOfQuestions: Int,
        maxRange: Int
    ) {
        self.coordinator = coordinator
        self.questionType = questionType
        self.numberOfQuestions = numberOfQuestions
        self.maxRange = maxRange
    }
    
    // MARK: - Functions
    func setup() {
        addQuestions()
    }
    
    func submitResponse() {
        guard isSubmitted else {
            isSubmitted = true
            gameFields.submitButtonAction = .continueQuestion
            setAnswerState()
            
            return
        }
        
        moveToNextQuestion()
        cleanUpFields()
        
    }
    
    func dismiss() {
        coordinator.dismissCover()
    }
    
    private func addQuestions() {
        for _ in 0..<numberOfQuestions {
            
            let question = Question(
                type: questionType,
                firstNumber: Int.random(in: 1...maxRange),
                secondNumber: Int.random(in: 1...maxRange)
            )
            
            questions.append(question)
        }
    }
    
    private func moveToNextQuestion() {
        guard !isFinalQuestion else {
            showQuestionFinishedAlert = true
            
            return
        }
        
        answer = ""
        currentQuestionIndex += 1
    }
    
    private func setCorrectAnswer() {
        correctAnswers += 1
    }
    
    private func setIncorrectAnswer() {
        incorrectAnswers += 1
    }
    
    private func cleanUpFields() {
        isSubmitted = false
        gameFields.submitButtonAction = .submit
        gameFields.textColor = .darkText
        gameFields.buttonColor = .basic
    }
    
    private func setAnswerState() {
        guard isAnswerCorrect else {
            setIncorrectAnswer()
            gameFields.buttonColor = .basicRed
            gameFields.textColor = .basicRed
            
            return
        }
        
        setCorrectAnswer()
    }
}

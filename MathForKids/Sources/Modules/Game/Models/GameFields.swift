//
//  GameFields.swift
//  MathForKids
//
//  Created by Gabriel Campos on 6/5/25.

import Foundation

struct GameFields {
    var submitButtonAction: ButtonAction
    var textColor: AppColor
    var buttonColor: AppColor
    
    init() {
        self.submitButtonAction = .submit
        self.textColor = .darkText
        self.buttonColor = .basic
    }
}

enum ButtonAction {
    case submit
    case continueQuestion
    
    var value: String {
        switch self {
        case .submit:
            return "Enviar"
        case .continueQuestion:
            return "Continuar"
        }
    }
}

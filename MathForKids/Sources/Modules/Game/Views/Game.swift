//
//  Game.swift
//  MathForKids

import SwiftUI

struct Game: View {
    @StateObject private var viewModel: GameViewModel
    
    init(viewModel: GameViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var backgroundAnswerColor: AppColor {
        guard viewModel.isSubmitted else {
            return .dataText
        }
        
        guard viewModel.isAnswerCorrect else {
            return .redBackGround
        }
        
        return .backGround
    }
    
    var body: some View {
        
        return
            VStack {
                navigationLeftHeaderIcon
                
                ProgressView(
                    value: Double(viewModel.currentQuestionIndex+1),
                    total: Double(viewModel.numberOfQuestions)
                )
                .tint(Color(appColor: .dataText))
                .padding(.all)
                
                HStack(spacing: 30) {
                    Avatar(avatar: "pig")
                    VStack(alignment: .trailing, spacing: 7) {
                        Text(viewModel.numberOfQuestionsLeftText)
                            .padding(10)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color(appColor: .backGround))
                            .foregroundColor(Color(appColor: .dataText))
                            .cornerRadius(5)
                        Text(viewModel.correctAnswersText)
                            .padding(10)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color(appColor: .basic))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        Text(viewModel.inCorrectAnswersText)
                            .padding(10)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color(red: 233 / 255, green: 118 / 255, blue: 111 / 255))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                    .padding(.top, 80)
                    .padding(.bottom, 30)
                
                VStack {
                    Text(viewModel.operationQuestionText)
                        .font(.system(size: 52, weight: .bold))
                        .foregroundColor(Color(appColor: viewModel.gameFields.textColor))
                        .padding(.top, 30)
                    TextField(viewModel.yourAnswerText, text: $viewModel.answer)
                        .keyboardType(.numberPad)
                        .foregroundColor(Color(appColor: viewModel.gameFields.textColor))
                        .frame(width: 245, height: 75, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 24, weight: .bold))
                        .multilineTextAlignment(.center)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 0, x: 0, y: 5)
                        .border(Color(red: 236 / 255, green: 244 / 255, blue: 239 / 255), width: 1) // TODO Think about making this a custom modifier and apply everywhere the same shadow instead of different one
                    Spacer()
                    
                    if viewModel.isSubmitted {
                        Text(viewModel.correctAnswerResultText)
                            .bold()
                            .font(.system(size: 24))
                            .padding(.vertical)
                            .foregroundColor(Color(appColor: viewModel.gameFields.textColor))
                    }
                    
                    BottomButton(
                        text: viewModel.gameFields.submitButtonAction.value,
                        disabled: !viewModel.isSubmitEnable,
                        color: viewModel.gameFields.buttonColor.rawValue,
                        onPress: viewModel.submitResponse)
                }
                .background(Color(appColor: backgroundAnswerColor))
                .edgesIgnoringSafeArea(.all)
                
            }
            .onAppear(perform: viewModel.setup)
            .alert(
                Text("Juego Finalizado"),
                isPresented: $viewModel.showQuestionFinishedAlert
            ) {
                Button("Entendido") {
                    viewModel.dismiss()
                }
            } message: {
                Text("Nos vemos la proxima!")
            }
             
        }
    
    var navigationLeftHeaderIcon: some View {
        VStack {
            Button(action: {
                viewModel.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundStyle(Color(appColor: .dataText))
            })
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
}

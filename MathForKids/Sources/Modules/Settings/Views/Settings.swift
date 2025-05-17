//
//  Settings.swift
//  MathForKids

import SwiftUI

struct Settings: View {
    @StateObject private var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack(spacing: 40) {
                    VStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(appColor: .dataText))
                            .font(.system(size: 24))
                            .padding(.top, 5)
                    }
                    .frame(width: 70, height: 70)
                    .background(Color(appColor: .backGround))
                    .cornerRadius(8)
                    
                    Avatar(avatar: "pig")
                        .padding(.bottom, 20)
                    
                    
                    VStack {
                        Image(systemName: "hare.fill")
                            .foregroundColor(Color(appColor: .dataText))
                            .font(.system(size: 24))
                            .padding(.top, 5)
                    }
                    .frame(width: 70, height: 70)
                    .background(Color(appColor: .backGround))
                    .cornerRadius(8)
                }
                
                Text(viewModel.selectYourGameText)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(Color(appColor: .darkText))
                    .padding(.bottom, 20)
                Divider()
                    .padding(.bottom, 20)
                    .padding(.horizontal)
            }
            VStack() {
                Picker(selection: $viewModel.questionType, label: EmptyView()) {
                    Image(systemName: "plus")
                        .tag(QuestionType.addition)
                    
                    Image(systemName: "minus")
                        .tag(QuestionType.susbtraction)
                    
                    Image(systemName: "multiply")
                        .tag(QuestionType.multiplication)
                }
                .labelsHidden()
                .padding(.horizontal)
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 30)
                
                Stepper(value: $viewModel.maxRange, in: 2...12) {
                    Text(String(viewModel.maxRange))
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .font(.system(size: 24))
                        .background(Color(red: 29/255, green: 176/255, blue: 246/255))
                        .cornerRadius(100)
                    VStack(alignment: .leading) {
                        Text(viewModel.numberRangeText)
                            .bold()
                            .padding(.bottom, 5)
                        Text(viewModel.numberRangeDescription)
                    }
                }
                .padding(.horizontal)
                Divider()
                    .padding()
                Stepper(value: $viewModel.numberOfQuestions, in: 4...30) {
                    Text(String(viewModel.numberOfQuestions))
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .font(.system(size: 24))
                        .background(Color(appColor: .basic))
                        .cornerRadius(100)
                    VStack(alignment: .leading) {
                        Text(viewModel.questionRangeText)
                            .bold()
                            .padding(.bottom, 5)
                        Text(viewModel.questionDescription)
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
            BottomButton(text: viewModel.letsPlayText, onPress: {
                viewModel.presentQuiz()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MathForKidsApp()
    }
}

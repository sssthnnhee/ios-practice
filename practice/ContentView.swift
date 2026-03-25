//
//  ContentView.swift
//  practice
//
//  Created by 초긍정행운의포춘쿠키 on 3/11/26.
//

import SwiftUI

struct ContentView: View {
    // 변하지 않는 변수 : let으로 선언
    let choices = ["가위", "바위", "보"]
    // 화면을 결정하는 '상태'(바뀔수있음)를 var 로 선언함
    @State var computer = "?"
    @State var result = "선택하세요!"
    @State var gameStarted = false
    @State var refused = false
    @State var goodbye = false
    @State var userChoice = ""
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            if (gameStarted==false) && !refused {
                
                Text("컴퓨터 씨 : 저랑 가위바위보 한 판 합시다.")
                    .font(.title2)
                
                Text("도전을 받아들이시겠습니까?")
                    .font(.title3)
                
                HStack {
                    Button("Yes") {
                        gameStarted = true
                    }
                    
                    Button("No") {
                        refused = true
                    }
                }
                .font(.title)
            }
            
            else if refused {
                Text("컴퓨터 씨 : 흥... 겁쟁이.")
                    .font(.title)
                Button("bye .") {
                    refused = false
                    goodbye = true
                }
            }
            
            else if goodbye {
                
                Text("컴퓨터 씨 : bye ㅋㅋ")
                    .font(.title)
                
                Button("종료") {
                    exit(0)
                }
                .font(.title2)
            }
            
            else {
                
                Text("컴퓨터")
                    .font(.title2)
                
                Text(iconFor(choice: computer))
                    .font(.system(size: 120))
                
                HStack(spacing: 40) {
                    
                    Button("✌️") {
                        userChoice = "가위"
                        play(user: "가위")
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(userChoice == "가위" ? Color.blue : Color.clear, lineWidth: 4)
                    )
                    
                    Button("✊") {
                        userChoice = "바위"
                        play(user: "바위")
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(userChoice == "바위" ? Color.blue : Color.clear, lineWidth: 4)
                    )
                    
                    Button("✋") {
                        userChoice = "보"
                        play(user: "보")
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(userChoice == "보" ? Color.blue : Color.clear, lineWidth: 4)
                    )
                    
                }
                .font(.system(size: 60))
                .disabled(computer != "?")
                
                Text("결과 : \(result)")
                    .font(.title2)
                
                if computer != "?" {
                    
                    HStack {
                        
                        Button("한판 더!") {
                            computer = "?"
                            result = "선택하세요!"
                            userChoice = ""
                        }
                        
                        Button("bye .") {
                            goodbye = true
                        }
                    }
                    .font(.title3)
                }
            }
        }
        .padding()
    }
    
    func iconFor(choice: String) -> String {
        switch choice {
        case "가위":
            return "✌️"
        case "바위":
            return "✊"
        case "보":
            return "✋"
        default:
            return "❓"
        }
    }
    
    func play(user: String) {
        
        computer = choices.randomElement()!
        
        if user == computer {
            result = "무승부."
        }
        else if (user == "가위" && computer == "보") ||
                (user == "바위" && computer == "가위") ||
                (user == "보" && computer == "바위") {
            result = "승리!"
        }
        else {
            result = "패배!"
        }
    }
}

#Preview {
    ContentView()
}

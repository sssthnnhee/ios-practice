//
//  ContentView.swift
//  practice
//
//  Created by 초긍정행운의포춘쿠키 on 3/11/26.
//

import SwiftUI

struct ContentView: View {
    
    let choices = ["가위", "바위", "보"]
    
    @State var computer = "?"
    @State var result = "선택하세요!"
    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("컴퓨터 : \(computer)")
                .font(.largeTitle)
            
            HStack {
                Button("✌️") {
                    play(user: "가위")
                }
                
                Button("✊") {
                    play(user: "바위")
                }
                
                Button("✋") {
                    play(user: "보")
                }
            }
            .font(.title)
            
            Text("결과 : \(result)")
                .font(.title2)
            
        }
        .padding()
    }
    
    func play(user: String) {
        
        computer = choices.randomElement()!
        
        if user == computer {
            result = "무승부"
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

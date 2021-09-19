//
//  ExerciseView.swift
//  MyWorkout
//
//  Created by Kunatip Satsomnuk on 10/9/2564 BE.
//

import SwiftUI
import AVKit

struct ExerciseView: View {
    @State private var showHistory = false
    @State private var showSuccess = false
    
    @Binding var selectedTab: Int
    
    let index: Int
    
    @State private var timerDone = false
    @State private var showTimer = false
    
    @EnvironmentObject var history: HistoryStore
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: Exercise.exercises[index].exerciseName)
                
                if let url = Bundle.main.url(forResource: Exercise.exercises[index].videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Could not find \(Exercise.exercises[index].videoName).mp4")
                        .foregroundColor(.red)
                }
                
                HStack(spacing: 150) {
                    Button(NSLocalizedString("Start", comment: "begin excercise")) {
                        showTimer.toggle()
                    }
                    .foregroundColor(.red)
                    .font(.title)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color.red, lineWidth: 2))
                    
                    Button(NSLocalizedString("Done", comment: "mark as finished")) {
                        history.addDoneExercise(Exercise.exercises[index].exerciseName)
                        timerDone = false
                        showTimer.toggle()
                        
                        if lastExercise {
                            showSuccess.toggle()
                        } else {
                            selectedTab += 1
                        }
                    }
                    .foregroundColor(!timerDone ? .gray : .green)
                    .font(.title)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color(!timerDone ? .gray : .green), lineWidth: 2))
                    .disabled(!timerDone)
                    .sheet(isPresented: $showSuccess) {
                        SuccessView(selectecTab: $selectedTab)
                    }
                    
                }
                .font(.title3)
                .padding()
                
                if showTimer {
                    TimerView(timeDone: $timerDone)
                }
                
                Spacer()
                
                RatingView(exerciseIndex: index)
                    .padding()
                
                Button(NSLocalizedString("History", comment: "view user history")) {
                    showHistory.toggle()
                }
                .padding(.bottom)
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
            }
        }
    }
    
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(selectedTab: .constant(1), index: 0)
            .environmentObject(HistoryStore())
    }
}

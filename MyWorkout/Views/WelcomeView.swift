//
//  WelcomeView.swift
//  MyWorkout
//
//  Created by Kunatip Satsomnuk on 10/9/2564 BE.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int
    @State private var showHistory = false
    
    var body: some View {
        VStack {
            HeaderView(selectedTab: $selectedTab, titleText: NSLocalizedString("Welcome", comment: "greeting"))
            
            Spacer()
            
            VStack {
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("Get fit", comment: "title"))
                        .font(.largeTitle)
                    Text(NSLocalizedString("with high intensity interval training", comment: "title detail"))
                }
                Image("welcome-image")
                    .resizeToFill(width: 240, height: 240)
                   .clipShape(Rectangle())
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                selectedTab = 0
            }) {
                Text(NSLocalizedString("Get Started", comment: "start app"))
                Image(systemName: "arrow.right.square")
            }
            .font(.title2)
            .padding()
            .foregroundColor(.green)
            .background(RoundedRectangle(cornerRadius: 20).stroke(Color.green, lineWidth: 2))
            
            Spacer()
            
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

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(selectedTab: .constant(9))
    }
}

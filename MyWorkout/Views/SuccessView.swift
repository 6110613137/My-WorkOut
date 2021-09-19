//
//  SuccessView.swift
//  MyWorkout
//
//  Created by Kunatip Satsomnuk on 10/9/2564 BE.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectecTab: Int
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizeToFill(width: 75, height: 75)
                    .foregroundColor(.green)
                
                Text(NSLocalizedString("High Five!", comment: "end title"))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                Text(NSLocalizedString(
                    """
                    Good job completing all four exercises!
                    Remember tomorrow's another day.
                    So eat well and get some rest.
                    """
                    , comment: "end title description"
                ))
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
            }
            
            VStack {
                Spacer()
                
                Button(NSLocalizedString("Continue", comment: "continue using app")) {
                    presentationMode.wrappedValue.dismiss()
                    selectecTab = 9
                }
                .font(.title)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 2))
                .padding(.bottom)
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(selectecTab: .constant(3))
    }
}

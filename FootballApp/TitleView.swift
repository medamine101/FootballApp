//
//  TitleView.swift
//  FootballApp
//
//  Created by Mohamed Smires on 10/5/22.
//

import SwiftUI

struct TitleView: View {
    
    @Binding var isLogged: Bool
    
    var body: some View {
        VStack{
            Text("FootBall Concussion Detector")
                .font(.system(size: 36))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            
            Text("Project By:\nMohamed Smires\nFawaz Tahir\nAlex Clark\nNicholas Zarantonello\nShashaank Sathyanarayanan")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            Button(action: {
                isLogged = true
            }) {
                HStack {
                    Image(systemName: "football")
                        .font(.title)
                    Text("Start")
                        .fontWeight(.semibold)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
            }
        }
    }
}

//struct TitleView_Previews: PreviewProvider {
//
//    @State var loggedIn = false
//
//    static var previews: some View {
//
//
//        TitleView(isLogged: $loggedIn)
//    }
//}

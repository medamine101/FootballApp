//
//  ContentView.swift
//  FootballApp
//
//  Created by Mohamed Smires on 10/5/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = "Wow"
    @State var loggedIn = false
    
    func logIn() {
        loggedIn.toggle()
    }

    
    var body: some View {
        VStack {
            
            if loggedIn {
                InfoView()
            } else {
                TitleView(isLogged: $loggedIn)
            }
            
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

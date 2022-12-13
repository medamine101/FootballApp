//
//  InfoView.swift
//  FootballApp
//
//  Created by Mohamed Smires on 10/5/22.
//

import SwiftUI

struct InfoView: View {
    
    @State var connection_status = ""
    @State var ip_address = "http://127.0.0.1"
    @State var port = "8080"
    @State var concussion_status = false
    
    var body: some View {
        
        VStack {
            
            VStack {
                TextField("IP Address", text: $ip_address)
                    .border(.secondary)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 20)
                TextField("Port", text: $port)
                    .border(.secondary)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 20.0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
            VStack {
                Text(concussion_status ? "Concussion Possible" : "Player Healthy")
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20.0)
                            .fill(concussion_status ? Color.red : Color.green)
//                            .frame(width: 300, height: 100)
                        )
                        .font(.system(size: 30, weight: .bold, design: .rounded))
//                Text("Gyro information")
                Text(connection_status)
                    .task {
                        DispatchQueue.global().async(execute:  {
                                while true {
                                    maintainServerConnection(item: "gyro")
                                    sleep(2)
                                }
                            })
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }
        
    }
    
    func maintainServerConnection(item: String) {
            
        let completeUrl = URL(string: "\(self.ip_address):\(self.port)/\(item)")
        guard let requestUrl = completeUrl else { fatalError() }
        
        let request = URLRequest(url: requestUrl)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                self.connection_status = "Error connecting to helmet at \(self.ip_address)/\(self.port): " + error.localizedDescription
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                self.connection_status = "Connected to helmet"
                self.concussion_status = dataString.contains("true")
            }
            
        }
        task.resume()

    }
    
}

struct PlayerHealth: Codable {
    let Concussion: String
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

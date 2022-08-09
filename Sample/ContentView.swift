//
//  ContentView.swift
//  Sample
//
//  Created by Mohammad Jeeshan on 07/08/22.
//

import SwiftUI
import GoogleLogin

struct ContentView: View {
    let clientID = "1052912351070-ir4udtjti6n0oqav7kbjmc8beomcllmj.apps.googleusercontent.com"
    
    var body: some View {
        VStack (spacing: 10){
            Spacer().frame(height: 30)
            Text("GoogleLogin Sample")
                .font(.title)
                .bold()
            Spacer()
            
            Button {
               let googleLoginController = GoogleLoginController(delegate: self)
                googleLoginController.beginGoogleLogin(clientID: clientID)
            } label: {
                Text("Continue with Google")
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .padding()
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            Spacer()
        }
    }
}

//MARK: GoogleLogin Delegate Methods
extension ContentView: GoogleLoginStatusDelegate{
    func loginSuccess(userID: String, idToken: String, profileImageUrl: String?, email: String?, firstName: String?, lastName: String?) {
        debugPrint(userID)
    }
    
    func loginFail(error: GoogleAuthError) {
        switch error {
        case .rootViewControllerNotFound:
            debugPrint("Root Controller not found")
        case .userIdNotFound:
            debugPrint("Data ID not found")
        case .userIdTokenNotFound:
            debugPrint("User Token not found")
        case .userDataNotFound:
            debugPrint("Data not found")
        case .unknown(let error):
            debugPrint(error)
        }
    }
}


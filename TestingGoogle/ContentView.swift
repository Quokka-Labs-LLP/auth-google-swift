//
//  ContentView.swift
//  TestingGoogle
//
//  Created by abhishek on 24/07/23.
//300796538157-758re35sat70pg8a1k6i1ic3a2j7i3ih.apps.googleusercontent.com

import SwiftUI
import GoogleLogin



struct ContentView: View {

    
    var body: some View {
        VStack (spacing: 10){
                   Spacer().frame(height: 30)
                   Text("GoogleLogin Sample")
                       .font(.title)
                       .bold()
                   Spacer()
                   
                   Button {
                      let googleLoginController = GoogleLoginController(delegate: self)
                       googleLoginController.beginGoogleLogin()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: GoogleLogin Delegate Methods
extension ContentView: GoogleLoginStatusDelegate{
    func loginSuccess(profileImageUrl: String?, email: String?, firstName: String?, lastName: String?) {
    
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

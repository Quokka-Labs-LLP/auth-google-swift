import SwiftUI
import UIKit
import GoogleSignIn

public protocol GoogleLoginStatusDelegate {
    func loginSuccess( profileImageUrl: String?,
                      email: String?, firstName: String?, lastName: String?)
    func loginFail(error: GoogleAuthError)
}

public class GoogleLoginController {
    private var delegate: GoogleLoginStatusDelegate?
    
    public init(delegate: GoogleLoginStatusDelegate) {
        self.delegate = delegate
    }
    
    public func beginGoogleLogin(){
        guard let rootViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            self.delegate?.loginFail(error: .rootViewControllerNotFound)
            return
        }
        handleSignIn(viewController: rootViewController)
    }
    

    
    private func handleSignIn(viewController : UIViewController){
        GIDSignIn.sharedInstance.signIn(
          withPresenting: viewController) { user, error in
              if let error = error {
                  self.delegate?.loginFail(error: .unknown(error.localizedDescription))
              }
              guard let currentUser = user else {
                  self.delegate?.loginFail(error: .userDataNotFound)
                  return
              }
              let userEmail = currentUser.user.profile?.email
              let firstName = currentUser.user.profile?.givenName
              let lastName  = currentUser.user.profile?.familyName
              let profileImageUrl = currentUser.user.profile?.imageURL(withDimension: 100)?.absoluteString
              self.delegate?.loginSuccess(profileImageUrl: profileImageUrl, email: userEmail, firstName: firstName, lastName: lastName)
          }
    }

}




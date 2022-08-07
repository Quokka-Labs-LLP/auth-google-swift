import SwiftUI
import UIKit
import GoogleSignIn

public protocol GoogleLoginStatusDelegate {
    func loginSuccess(userID: String, idToken: String, profileImageUrl: String?,
                      email: String?, firstName: String?, lastName: String?)
    func loginFail(error: GoogleAuthError)
}

open class GoogleLoginController {
    private var delegate: GoogleLoginStatusDelegate?
    
    public init(delegate: GoogleLoginStatusDelegate) {
        self.delegate = delegate
    }
    
    public func beginGoogleLogin(clientID: String){
        guard let rootViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            self.delegate?.loginFail(error: .rootViewControllerNotFound)
            return
        }
        signIn(clientID: clientID, viewController: rootViewController)
    }
    
    private func signIn(clientID: String, viewController: UIViewController){
        let signInConfig = GIDConfiguration.init(clientID: clientID)
        GIDSignIn.sharedInstance.signIn( with: signInConfig, presenting: viewController) { user, error in
            if let error = error {
                self.delegate?.loginFail(error: .unknown(error.localizedDescription))
            } else {
                guard let currentUser = user else {
                    self.delegate?.loginFail(error: .userDataNotFound)
                    return
                }
                guard let userID = currentUser.userID else {
                    self.delegate?.loginFail(error: .userIdNotFound)
                    return
                }
                guard let idToken = currentUser.authentication.idToken else {
                    self.delegate?.loginFail(error: .userIdTokenNotFound)
                    return
                }
                let userEmail = currentUser.profile?.email
                let firstName = currentUser.profile?.givenName
                let lastName = currentUser.profile?.familyName
                let profileImageUrl = currentUser.profile?.imageURL(withDimension: 100)?.absoluteString
                self.delegate?.loginSuccess(userID: userID, idToken: idToken,
                                           profileImageUrl: profileImageUrl, email: userEmail,
                                           firstName: firstName, lastName: lastName)
            }
        }
    }
}


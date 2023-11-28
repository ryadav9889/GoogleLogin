//
//  ViewController.swift
//  GoogleLogin
//
//  Created by Vijay's Braintech on 27/11/23.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func button(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
           guard error == nil else { return }

           // If sign in succeeded, display the app's main content View.
//            print(signInResult?.user.profile?.name as Any)
//            print(signInResult?.user.profile?.givenName as Any)
//            print(signInResult?.user.profile?.hasImage as Any)
            print(signInResult?.user.profile?.imageURL(withDimension: 55) as Any)
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let secView = storyBoard.instantiateViewController(withIdentifier: "SecViewController") as! SecViewController
            secView.name = signInResult?.user.profile?.name
            secView.email = signInResult?.user.profile?.email
            secView.userID = signInResult?.user.userID
            secView.url = signInResult?.user.profile?.imageURL(withDimension: 120)
            
            self.navigationController?.pushViewController(secView, animated: false)
         }
    }
    
}


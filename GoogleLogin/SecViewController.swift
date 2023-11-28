//
//  SecViewController.swift
//  GoogleLogin
//
//  Created by Vijay's Braintech on 27/11/23.
//

import UIKit
import GoogleSignIn



class SecViewController: UIViewController {

    @IBOutlet var nameLable: UILabel!
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    //MARK: - PROPERTIES
    var name: String?
    var userID: String?
    var email: String?
    var  url: URL?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLable.text = name
        userIDLabel.text = userID
        emailLabel.text = email
        downloadImage(from: url!)
        print(url as Any)
        self.navigationController?.navigationBar.isHidden = true
       
    }
    
    //MARK: - METHODS
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.profileImageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func signOut(sender: Any) {
      GIDSignIn.sharedInstance.signOut()
        print("hii")
        self.navigationController?.popViewController(animated: false)
    }
    
}

//
//  ViewController.swift
//  Share Photo
//
//  Created by Emir Keleş on 29.05.2023.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    @IBOutlet weak var sifreTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func girisYapTiklandi(_ sender: UIButton) {
        
        if emailTextField.text != "" && sifreTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: sifreTextField.text!) { authdataresult, error in
                if error != nil {
                    self.hataMesaji(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata aldınız tekrar deneyin")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            self.hataMesaji(titleInput: "Hata!", messageInput: "Email ve Parola Giriniz!")
        }
        
        
    }
    
    @IBAction func kayitOlTiklandi(_ sender: UIButton) {
        if emailTextField.text != "" && sifreTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: sifreTextField.text!) { authdataresult, error in
                if error != nil {
                    self.hataMesaji(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata aldınız tekrar deneyin")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
                
            }
        } else {
            hataMesaji(titleInput: "Hata!", messageInput: "Email ve Parola Giriniz!")
        }
    }
    func hataMesaji(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}


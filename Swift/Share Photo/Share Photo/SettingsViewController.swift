//
//  SettingsViewController.swift
//  Share Photo
//
//  Created by Emir Keleş on 29.05.2023.
//

import UIKit
import Firebase
class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cikisYapTiklandi(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("hata")
        }
        
    }
}

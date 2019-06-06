//
//  ViewController.swift
//  SnappaAppa
//
//  Created by Luke Luneau on 6/5/19.
//  Copyright © 2019 DKE Bruiser. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

    // Login Button Actions
    @IBAction func loginTapped(_ sender: UIButton) {
        
        // Get default authUI object
        let authUI = FUIAuth.defaultAuthUI()

        print("---------------------")
        
        guard authUI != nil else{
            return
            // log error
        }
        
        print("passsssssss")
        // Set ourselves as the delegate
        authUI?.delegate = self
        
        // Get reference to authUI view controller
        let authViewController = authUI!.authViewController()
        
        print("Auth")
        // Show it
        present(authViewController, animated:true, completion: nil)
    }
}

extension ViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        
        // Check if there was an error
//        guard error == nil else {
//            // log error
//            return
//        }
        
        
        print("Down Here")
        
        if error != nil {
            return
        }
        
        // get user id property
        //authDataResult?.user.uid
        
        performSegue(withIdentifier: "Snappa", sender: self)
    }
}

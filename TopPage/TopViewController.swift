//
//  ViewController.swift
//  TopPage
//
//  Created by 小田光樹 on 2018/04/05.
//  Copyright © 2018年 Koki. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    
    @IBAction func toLogInButton(_ sender: Any) {
        transitionToLogIn()
    }
    
    
    @IBAction func toSignUpButton(_ sender: Any) {
        transitionToSignUp()
    }
    
    func transitionToLogIn() {
        performSegue(withIdentifier: "toLogIn01", sender: self)
    }
    
    func transitionToSignUp() {
        performSegue(withIdentifier: "toSignIn01", sender: self)
    }
    

}


//
//  ViewController.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginClicked(_ sender: Any) {
        goToDestinationVC(storyboardName: Constants.loginStoryboardName, storyboardID: Constants.loginIdentifier)
    }
    @IBAction func registerClicked(_ sender: Any) {
        goToDestinationVC(storyboardName: Constants.registerStoryboardName, storyboardID: Constants.registerIdentifier)
    }
    
}


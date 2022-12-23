//
//  LoginViewController.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import UIKit

    protocol LoginDisplayLogic: AnyObject {
    func displayAlert(alertTitle: String, actionTitle: String, message: String)
    func displayOfficePage(alertTitle: String, actionTitle: String, message: String)

}

final class LoginViewController: UIViewController {
    
    var interactor: LoginBusinessLogic?
    var router: (LoginRoutingLogic & LoginDataPassing)?
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    @IBAction func loginClicked(_ sender: Any) {
        interactor?.loginFirebase(request: .init(email: emailTextField.text!, password: passwordTextField.text!))
        goToDestinationVC(storyboardName: Constants.homePageStoryboardName, storyboardID: Constants.homePageIdentifier)
    }
    
}

extension LoginViewController: LoginDisplayLogic {
    
    func displayAlert(alertTitle: String, actionTitle: String, message: String) {
        getAlert(alertTitle: alertTitle, actionTitle: actionTitle, message: message)
    }
    func displayOfficePage(alertTitle: String, actionTitle: String, message: String) {
        
        getAlert(alertTitle: alertTitle, actionTitle: actionTitle, message: message)

    }
}

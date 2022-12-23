//
//  RegisterViewController.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import UIKit

protocol RegisterDisplayLogic: AnyObject {
    func displayAlert(alertTitle: String, actionTitle: String, message: String)
    func displayOfficePage(alertTitle: String, actionTitle: String, message: String)
}

final class RegisterViewController: UIViewController {
    
    var interactor: RegisterBusinessLogic?
    var router: (RegisterRoutingLogic & RegisterDataPassing)?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.appName
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = RegisterInteractor()
        let presenter = RegisterPresenter()
        let router = RegisterRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        interactor?.registerFirebase(request: .init(email: emailTextField.text!, password: passwordTextField.text!))
    }
    
}

extension RegisterViewController: RegisterDisplayLogic {

    func displayAlert(alertTitle: String, actionTitle: String, message: String) {
        getAlert(alertTitle: alertTitle, actionTitle: actionTitle, message: message)
    }
    func displayOfficePage(alertTitle: String, actionTitle: String, message: String) {
        router?.routeToLoginPage()
        getAlert(alertTitle: alertTitle, actionTitle: actionTitle, message: message)
    }
}

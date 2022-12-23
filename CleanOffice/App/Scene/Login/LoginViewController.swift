//
//  LoginViewController.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import UIKit

protocol LoginDisplayLogic: AnyObject {
    
}

final class LoginViewController: UIViewController {
    
    var interactor: LoginBusinessLogic?
    var router: (LoginRoutingLogic & LoginDataPassing)?
    
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
}

extension LoginViewController: LoginDisplayLogic {
    
}

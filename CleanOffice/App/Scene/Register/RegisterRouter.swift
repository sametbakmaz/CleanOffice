//
//  RegisterRouter.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation
import UIKit

protocol RegisterRoutingLogic: AnyObject {
    func routeToLoginPage()
}

protocol RegisterDataPassing: AnyObject {
    var dataStore: RegisterDataStore? { get }
}

final class RegisterRouter: RegisterRoutingLogic, RegisterDataPassing {
    
    weak var viewController: RegisterViewController?
    var dataStore: RegisterDataStore?
    
    func routeToLoginPage() {
        let storyboard = UIStoryboard(name: Constants.loginStoryboardName, bundle: nil)
        let destVC: LoginViewController = storyboard.instantiateViewController(identifier: Constants.loginIdentifier)
        destVC.modalPresentationStyle = .overFullScreen
        viewController?.navigationController?.pushViewController(destVC, animated: true)
    }
}

//
//  LoginRouter.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation
import UIKit

protocol LoginRoutingLogic: AnyObject {
    func routeToHomePage()
}

protocol LoginDataPassing: AnyObject {
    var dataStore: LoginDataStore? { get }
}

final class LoginRouter: UIViewController, LoginRoutingLogic, LoginDataPassing {

    

    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    func routeToHomePage(){
    

    }
    
}
    


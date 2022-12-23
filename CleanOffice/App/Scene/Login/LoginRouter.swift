//
//  LoginRouter.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation

protocol LoginRoutingLogic: AnyObject {
    
}

protocol LoginDataPassing: class {
    var dataStore: LoginDataStore? { get }
}

final class LoginRouter: LoginRoutingLogic, LoginDataPassing {
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
}

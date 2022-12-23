//
//  RegisterRouter.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation

protocol RegisterRoutingLogic: AnyObject {
    
}

protocol RegisterDataPassing: class {
    var dataStore: RegisterDataStore? { get }
}

final class RegisterRouter: RegisterRoutingLogic, RegisterDataPassing {
    
    weak var viewController: RegisterViewController?
    var dataStore: RegisterDataStore?
    
}

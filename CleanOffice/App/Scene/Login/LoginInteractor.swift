//
//  LoginInteractor.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation

protocol LoginBusinessLogic: AnyObject {
    
}

protocol LoginDataStore: AnyObject {
    
}

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkingLogic = LoginWorker()
    
}

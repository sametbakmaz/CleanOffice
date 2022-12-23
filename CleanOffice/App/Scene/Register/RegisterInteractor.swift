//
//  RegisterInteractor.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation

protocol RegisterBusinessLogic: AnyObject {
    
}

protocol RegisterDataStore: AnyObject {
    
}

final class RegisterInteractor: RegisterBusinessLogic, RegisterDataStore {
    
    var presenter: RegisterPresentationLogic?
    var worker: RegisterWorkingLogic = RegisterWorker()
    
}

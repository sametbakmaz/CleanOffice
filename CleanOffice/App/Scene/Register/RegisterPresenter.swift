//
//  RegisterPresenter.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation

protocol RegisterPresentationLogic: AnyObject {
    func presentAlert(response: Register.Case.Response)
    func presentLoginPageAlert(response: Register.Case.Response)
}

final class RegisterPresenter: RegisterPresentationLogic {
    
    weak var viewController: RegisterDisplayLogic?
    
    func presentAlert(response: Register.Case.Response) {
        viewController?.displayAlert(alertTitle: response.alertTitle ?? "",
                                     actionTitle: response.actionTitle ?? "",
                                     message: response.alertMessage ?? "")
    }
    func presentLoginPageAlert(response: Register.Case.Response) {
        viewController?.displayOfficePage(alertTitle: response.alertTitle ?? "", actionTitle: response.actionTitle ?? "", message: response.alertMessage ?? "")
    }
}

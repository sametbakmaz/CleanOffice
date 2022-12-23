//
//  LoginInteractor.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation
import Firebase

protocol LoginBusinessLogic: AnyObject {
    func loginFirebase (request: Register.Case.Request)
}

protocol LoginDataStore: AnyObject {
    
}

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    
    
    
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkingLogic = LoginWorker()
    
    func loginFirebase(request: Register.Case.Request) {
        guard let email = request.email, let password = request.password,
        !email.isEmpty, !password.isEmpty else {
            presenter?.presentAlert(response: .init(alertTitle: "Hata", alertMessage: "E-mail veya Şifre Boş Bırakılamaz", actionTitle: "Tekrar Deneyiniz!"))
            return
        }
        do{
            try Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
                if error != nil{
                    self.presenter?.presentAlert(response: .init(alertTitle: "Hata", alertMessage: error?.localizedDescription ?? "Hata Aldınız Tekrar Deneyiniz", actionTitle: "Tekrar Deneyiniz"))
                }
                
                print("Giriş Yapıldı")
                self.presenter?.presentLoginPageAlert(response: .init(alertTitle: "Giriş Başarılı", alertMessage: "Anasayfaya Yönlendiriliyorsunuz", actionTitle: "TAMAM"))
               
            }
        }   catch {
            self.presenter?.presentAlert(response: .init(alertTitle: "Hata", alertMessage: "Giriş Yapılamadı, Mail veya Şifre Yanlış", actionTitle: "Tamam"))
        }
    
    
}
    
}

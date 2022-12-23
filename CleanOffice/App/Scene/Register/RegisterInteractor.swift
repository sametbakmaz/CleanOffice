//
//  RegisterInteractor.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation
import Firebase
protocol RegisterBusinessLogic: AnyObject {
    func registerFirebase(request: Register.Case.Request)
}

protocol RegisterDataStore: AnyObject {
    
}

final class RegisterInteractor: RegisterBusinessLogic, RegisterDataStore {
    
    var presenter: RegisterPresentationLogic?
    var worker: RegisterWorkingLogic = RegisterWorker()
    
    func registerFirebase(request: Register.Case.Request){
        guard let email = request.email, let password = request.password,
        !email.isEmpty, !password.isEmpty else {
            presenter?.presentAlert(response: .init(alertTitle: "Hata", alertMessage: "E-mail veya Şifre Yanlış", actionTitle: "Tekrar Deneyiniz!"))
            return
        }
        do{
            try Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
                if error != nil{
                    self.presenter?.presentAlert(response: .init(alertTitle: "Hata", alertMessage: error?.localizedDescription ?? "Hata Aldınız Tekrar Deneyiniz", actionTitle: "Tekrar Deneyiniz"))
                }
                print("Kayıt Olundu")
                self.presenter?.presentLoginPageAlert(response: .init(alertTitle: "Kayıt Başarılı", alertMessage: "Login Ekranına Yönlendiriliyorsunuz, Yeni Üyeliğiniz İle Giriş Yapabilirsiniz", actionTitle: "TAMAM"))
            }
        } catch{
            presenter?.presentAlert(response: .init(alertTitle: "Hata", alertMessage: "Kullanıcı Zaten Kayıtlı", actionTitle: "Tamam"))
        }
        
    }
    
}

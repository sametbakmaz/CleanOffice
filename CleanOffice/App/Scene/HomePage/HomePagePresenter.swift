//
//  HomePagePresenter.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import Foundation

protocol HomePagePresentationLogic: AnyObject {
    
    func presentAlert(response: Alert.Fetch.Response)
    func presentData(response : HomePage.Case.ViewModel)
}

final class HomePagePresenter: HomePagePresentationLogic {
    func presentData(response: HomePage.Case.ViewModel) {
        viewController?.displayData(viewModel: response)
    }
       
    weak var viewController: HomePageDisplayLogic?
    
    func presentAlert(response: Alert.Fetch.Response) {
        viewController?.displayAlert(alertTitle: response.alertTitle ?? "Error",
                                     actionTitle: response.actionTitle ?? "Error",
                                     message: response.alertMessage ?? "Error")
    }
    
}

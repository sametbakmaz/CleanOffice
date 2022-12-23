//
//  HomePageInteractor.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import Foundation

import UIKit

protocol HomePageBusinessLogic: AnyObject {
    
    func getAlert()
    func fetchData()
}

protocol HomePageDataStore: AnyObject {
    var offices: OfficeDataArray? { get set }
}

final class HomePageInteractor: HomePageBusinessLogic, HomePageDataStore {
    
    var presenter: HomePagePresentationLogic?
    var worker: HomePageWorkingLogic = HomePageWorker()
    var offices: OfficeDataArray?
    
    func fetchData(){
        
        presenter?.presentData(response: .init(homePageCellListViewModel: [
            .init(
                  image: UIImage(named: "mobven-4"),
                  name: "MOBVEN YTÜ OFİS",
                  statement: "Yıldız Teknik Üniversitesi Davutpaşa Kampüsü Teknopark"),
            .init(
                  image: UIImage(named: "mobven-ofis-2"),
                  name: "MOBVEN ITÜ OFİS",
                  statement: "İstanbul Teknik Üniversitesi Ayazağa Kampüsü Teknopark"),
        ])
        )
    }
    
    
    func getAlert() {
        presenter?.presentAlert(response: .init(alertTitle: "Error", alertMessage: "An error occured when occuring cells. Please Pull to Refresh or Try Again Later", actionTitle: "OK"))
    }
}

//
//  HomePageInteractor.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import Foundation

protocol HomePageBusinessLogic: AnyObject {
    
}

protocol HomePageDataStore: AnyObject {
    
}

final class HomePageInteractor: HomePageBusinessLogic, HomePageDataStore {
    
    var presenter: HomePagePresentationLogic?
    var worker: HomePageWorkingLogic = HomePageWorker()
    
}

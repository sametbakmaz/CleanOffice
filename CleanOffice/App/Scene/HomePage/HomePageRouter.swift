//
//  HomePageRouter.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import Foundation

protocol HomePageRoutingLogic: AnyObject {
    
}

protocol HomePageDataPassing: class {
    var dataStore: HomePageDataStore? { get }
}

final class HomePageRouter: HomePageRoutingLogic, HomePageDataPassing {
    
    weak var viewController: HomePageViewController?
    var dataStore: HomePageDataStore?
    
}

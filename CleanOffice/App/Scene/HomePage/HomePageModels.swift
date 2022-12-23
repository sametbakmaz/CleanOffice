//
//  HomePageModels.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import Foundation
import UIKit

// swiftlint:disable nesting
enum HomePage {
    
    enum Case {
        
        struct Request {
            
        }
        
        struct Response {
            var homePageResponse: [HomePageData]
        }
        
        struct ViewModel { //viewControllerda gösterilecek model
            
            let homePageCellListViewModel: [HomePage.Case.ViewModel.homePageCellModel]
            
            struct homePageCellModel {
                
                var image: UIImage?
                var name: String?
                var statement: String?
            }
        }
        
    }
    typealias OfficeDataArray = [HomePageData]
}
// swiftlint:enable nesting

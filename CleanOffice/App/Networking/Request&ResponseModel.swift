//
//  Request&ResponseModel.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import Foundation

struct HomePageData: Codable {
    
    public init(image: String?, name: String?, statement: String?) {

        
        self.image = image
        self.statement = statement
        self.name = name
        
    }

    let image: String?
    let name: String?
    let statement: String?
}

typealias OfficeDataArray = [HomePageData]

//
//  LoginModels.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation

// swiftlint:disable nesting
enum Login {
    
    enum Case {
        
        struct Request {
            let email : String?
            var password : String?
        }
        
        struct Response {
            let alertTitle: String?
            let alertMessage: String?
            let actionTitle: String?
        }
        
        struct ViewModel {
            
        }
        
    }
    
}
// swiftlint:enable nesting

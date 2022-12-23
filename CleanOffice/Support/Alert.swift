//
//  Alert.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import Foundation

enum Alert {
    
    enum Fetch {
        
        struct Request {
            let alertTitle: String?
            let alertMessage: String?
            let actionTitle: String?
        }
        
        struct Response {
            let alertTitle: String?
            let alertMessage: String?
            let actionTitle: String?
        }
    }
}

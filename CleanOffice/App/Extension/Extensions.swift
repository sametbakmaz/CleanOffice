//
//  Extensions.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 24.10.2022.
//

import Foundation
import UIKit

public extension UIViewController {
    
}

extension UIViewController {
    
    func goToDestinationVC(storyboardName: String, storyboardID: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: storyboardID)
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
extension UIViewController {
    func hataMesaji(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
     }
}
extension UIViewController {
    
    func getAlert(alertTitle: String, actionTitle: String, message: String) {
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}
//extension HomePageViewController {
//    func registerHomePageTableView() {
//        tableView.register(UINib(nibName: Constants.tableViewCellNibName, bundle: .main), forCellReuseIdentifier: Constants.tableViewCellIdentifier)
//    }
//}

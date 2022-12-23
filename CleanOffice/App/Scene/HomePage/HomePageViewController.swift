//
//  HomePageViewController.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import UIKit
import SwiftUI

protocol HomePageDisplayLogic: AnyObject {
    
    func displayAlert(alertTitle: String, actionTitle: String, message: String)
    func displayData(viewModel: HomePage.Case.ViewModel)
}

final class HomePageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: HomePageBusinessLogic?
    var router: (HomePageRoutingLogic & HomePageDataPassing)?
    var viewModel = HomePage.Case.ViewModel(homePageCellListViewModel: [])
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = "Log Out"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomePageViewCell", bundle: nil), forCellReuseIdentifier: Constants.homePageCellIdentifier)
        interactor?.fetchData()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = HomePageInteractor()
        let presenter = HomePagePresenter()
        let router = HomePageRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension HomePageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.homePageCellListViewModel.count
    }
    
    //MARK: This rows occurs from what
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.homePageCellIdentifier, for: indexPath) as? HomePageViewCell else {
            interactor?.getAlert()
            fatalError("Hata Cell Eklenemedi")
        }
        
        let model = viewModel.homePageCellListViewModel[indexPath.row]
        cell.configureCell(viewModel: model)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomePageViewController: HomePageDisplayLogic {
    
    
    func displayAlert(alertTitle: String, actionTitle: String, message: String) {
        getAlert(alertTitle: alertTitle, actionTitle: actionTitle, message: message)
    }
    
    func displayData(viewModel: HomePage.Case.ViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

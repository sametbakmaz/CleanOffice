//
//  HomePageViewCell.swift
//  CleanOffice
//
//  Created by Abdulsamet Bakmaz on 3.11.2022.
//

import UIKit
import SDWebImage


class HomePageViewCell: UITableViewCell {
    
   
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var statementText: UITextView!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var cellModel = HomePage.Case.ViewModel.homePageCellModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(viewModel: HomePage.Case.ViewModel.homePageCellModel) {
        cellModel = viewModel
        titleText.text = viewModel.name
        statementText.text = viewModel.statement
        cellImageView.image = viewModel.image
        //cellImageView.sd_setImage(with: URL(string: viewModel.image ?? "Not Found"))
        
    }
    
}

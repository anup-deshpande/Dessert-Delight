//
//  DetailViewController.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/7/23.
//

import UIKit

class DetailViewController: UIViewController {

    var mealId: String?
    var dataSource: Meal?
    private var viewModel: DetailViewModel!
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var mealTableView: UITableView!
    
    //MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let mealId = mealId else { fatalError("mealId not found.") }
        
        viewModel = DetailViewModel(mealId: mealId, delegate: self, networkService: NetworkService())
        
        mealTableView.registerNib(for: MealDetailHeaderTableViewCell.self)
        mealTableView.registerNib(for: MeasurementsTableViewCell.self)
        mealTableView.registerNib(for: MealInstructionsTableViewCell.self)
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
    }
}

//MARK: - UITableView delegate methods

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let headerCell = 1
        let ingredientsList = viewModel.meal?.measurements.count ?? 0
        let instructions = 1
        
        return headerCell + ingredientsList + instructions
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let meal = viewModel.meal else { return UITableViewCell() }
        let ingredientsList = meal.measurements
        
        switch indexPath.row {
            
        case 0:
            let cell: MealDetailHeaderTableViewCell = tableView.dequeueResusableCell(for: indexPath)
            cell.configureWith(meal: meal)
            return cell
            
        case 1..<(1 + ingredientsList.count):
            let cell: MeasurementsTableViewCell = tableView.dequeueResusableCell(for: indexPath)
            cell.configureWith(shouldShowTitle: indexPath.row == 1 ? true : false, measurement: ingredientsList[indexPath.row - 1])
            return cell
            
        default:
            let cell: MealInstructionsTableViewCell = tableView.dequeueResusableCell(for: indexPath)
            cell.configureWith(meal: meal)
            return cell
        }
    }
}

//MARK: -
extension DetailViewController: DetailViewModelDelegate {
    func mealUpdated() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            mealTableView.reloadData()
        }
    }
}


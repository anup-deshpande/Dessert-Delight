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
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var mealTableView: UITableView!
    
    
//    @IBOutlet weak var instructionsTextView: UITextView!
//    @IBOutlet weak var measurementsTextView: UITextView!
    
    //MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = mealId ?? "mealId empty"
        
        mealTableView.registerNib(for: MealDetailHeaderTableViewCell.self)
        mealTableView.registerNib(for: MeasurementsTableViewCell.self)
        mealTableView.registerNib(for: MealInstructionsTableViewCell.self)
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
        getMealDetails()
    }
    
    private func getMealDetails() {
        guard let mealId = mealId else {
            print("mealId is empty")
            return
        }
        
        NetworkService.shared.getMealDetails(mealID: mealId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let mealListResponse):
                dataSource = mealListResponse?.meals.first
                self.mealTableView.reloadData()
                break
                
            case .failure(let error):
                print("Error fetching API data: \(error)")
            }
        }
    }
    
//    private func updateMealDetails(meal: Meal?) {
//        guard let meal = meal else { return }
//        
//        if let instructions = meal.instructions {
//            self.instructionsTextView.isHidden = false
//            self.instructionsTextView.text = "Instructions: \n" + instructions
//        } else {
//            self.instructionsTextView.isHidden = true
//        }
//        
//        let measurement = meal.measurements
//        self.measurementsTextView.text = measurement.first!.0 + measurement.first!.1
//    }
    
}

//MARK: - UITableView delegate methods

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let headerCell = 1
        let ingredientsList = dataSource?.measurements.count ?? 0
        let instructions = 1
        
        return headerCell + ingredientsList + instructions
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let meal = dataSource else { return UITableViewCell() }
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


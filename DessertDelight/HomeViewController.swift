//
//  ViewController.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/6/23.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - IBOutlets

    @IBOutlet private weak var mealTableView: UITableView!
    private var dataSource = [Meal]()
    
    //MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "What's for Dessert!"
        
        mealTableView.registerNib(for: MealListTableViewCell.self)
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
        loadMealList()
        mealTableView.reloadData()
        
        
    }
    
    private func loadMealList() {
        NetworkService.shared.getMealList { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let mealListResponse):
                self.dataSource = mealListResponse!.meals
                self.mealTableView.reloadData()
            case .failure(let error):
                print("Error fetching API data: \(error)")
            }
        }
    }
    
}

//MARK: - UITableView delegate methods

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MealListTableViewCell = tableView.dequeueResusableCell(for: indexPath)
        cell.setMeal(meal: dataSource[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let meal = dataSource[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailViewController.mealId = meal.id
            self.navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            print("Error occured while initiating DetailViewController")
        }
    }
}


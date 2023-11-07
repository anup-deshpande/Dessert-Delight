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
        mealTableView.register(UINib(nibName: "MealListTableViewCell", bundle: nil), forCellReuseIdentifier: "MealListTableViewCell")
        
        self.title = "What's for Dessert!"
        
        loadMealList()
        mealTableView.reloadData()
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealListTableViewCell", for: indexPath) as? MealListTableViewCell else { return UITableViewCell() }
        cell.setMeal(meal: dataSource[indexPath.row])
        return cell
    }
    
    
}


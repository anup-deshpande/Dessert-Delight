//
//  ViewController.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/6/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlets

    @IBOutlet private weak var mealTableView: UITableView!
    private var dataSource = [Meal]()
    
    //MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as? MealTableViewCell else { return UITableViewCell() }
        cell.mealTitle.text = dataSource[indexPath.row].meal
        return cell
    }
    
    
}


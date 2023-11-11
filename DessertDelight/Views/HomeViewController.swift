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
    
    //MARK: - Properties

    private var viewModel: HomeViewModel!
    
    //MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "What's for Dessert!"
        
        viewModel = HomeViewModel(delegate: self, networkService: NetworkService())
        
        mealTableView.registerNib(for: MealListTableViewCell.self)
        mealTableView.delegate = self
        mealTableView.dataSource = self
     
        mealTableView.reloadData()
     }
}

//MARK: - UITableView delegate methods

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.mealList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MealListTableViewCell = tableView.dequeueResusableCell(for: indexPath)
        guard let meal = viewModel.getMealItem(for: indexPath.row) else { return UITableViewCell() }
        cell.configureWith(meal: meal)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let meal = viewModel.getMealItem(for: indexPath.row) else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailViewController.mealId = meal.id
            self.navigationController?.pushViewController(detailViewController, animated: true)
        } else {
            print("Error occured while initiating DetailViewController")
        }
    }
}

//MARK: - HomeViewModel Delegate methods
extension HomeViewController: HomeViewModelDelegate {
    func mealListUpdated() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.mealTableView.reloadData()
        }
    }
}



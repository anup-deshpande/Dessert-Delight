//
//  UITableView+.swift
//  DessertDelight
//
//  Created by Anup Deshpande on 11/9/23.
//

import UIKit

extension UITableView {
    
    /// deque cell using indexPath.
    /// - Returns: new cell with force casted to T
    public func dequeueResusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as! T
    }
    
    /// registers a nib to the table
    public func registerNib<T: UITableViewCell>(for cellClass: T.Type) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        self.register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }
}

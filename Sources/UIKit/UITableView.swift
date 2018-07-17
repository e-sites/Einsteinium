//
//  UITableView.swift
//  GoalsApp
//
//  Created by Bas van Kuijck on 16-09-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    public func scrollToBottom(section aSection: Int?=nil, animated: Bool) {
        guard let dataSource = self.dataSource else {
            return
        }
        
        let sections = dataSource.numberOfSections?(in: self) ?? 1
        
        let section = aSection ?? sections - 1
        if section < 0 {
            return
        }
        
        let lastRows = dataSource.tableView(self, numberOfRowsInSection: section)
        if lastRows <= 0 {
            return
        }
        let indexPath = IndexPath(row: lastRows - 1, section: section)
        self.scrollToRow(at: indexPath, at: .bottom, animated: animated)        
    }
}

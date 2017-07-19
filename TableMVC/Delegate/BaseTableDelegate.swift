//
//  BaseTableDelegate.swift
//  TableMVC
//
//  Created by Vyacheslav Khorkov on 17/07/2017.
//  Copyright © 2017 Vyacheslav Khorkov. All rights reserved.
//

import UIKit

protocol TableDelegateManager: class {
	
	func tableDelegate(_ delegate: BaseTableDelegate, didSelectRowAt indexPath: IndexPath)

}

class BaseTableDelegate: NSObject, UITableViewDelegate {
	
	weak var delegate: TableDelegateManager?
	var cellModels: [HeightConfigurable] = []
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		guard indexPath.row < cellModels.count else { return tableView.rowHeight }
		let model = cellModels[indexPath.row]
		return model.height ?? tableView.rowHeight
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		delegate?.tableDelegate(self, didSelectRowAt: indexPath)
	}
	
}

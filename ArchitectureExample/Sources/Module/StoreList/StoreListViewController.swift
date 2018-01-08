//
//  StoreListViewController.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 20..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol StoreListViewProtocol: class {
  func show()
}


final class StoreListViewController: UIViewController {
  
  // MARK: Properties
  
  var presenter: StoreListPresenterProtocol?
  
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupBinding()
    
    presenter?.viewDidLoad()
  }
  
  private func setupUI() {
    print("setupUI")
  }
  
  private func setupBinding() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
}


extension StoreListViewController: StoreListViewProtocol {
  func show() {
    tableView.reloadData()
  }
}


extension StoreListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter?.numberOfRows(in: section) ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    cell.backgroundColor = .green
    
    return cell
  }
}


extension StoreListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath)
  }
}

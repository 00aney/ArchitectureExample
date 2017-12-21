//
//  CityListViewController.swift
//  ArchitectureExample
//
//  Created by aney on 2017. 12. 19..
//  Copyright © 2017년 Ted Kim. All rights reserved.
//

import UIKit


protocol CityListViewProtocol: class {
  func showLoadingScreen()
  func show()
}

enum CityListViewState {
  case initial
  case loading
  case loaded
}

final class CityListViewController: UIViewController {
  
  // MARK: Properties
  
  var presenter: CityListPresenterProtocol?
  var state: CityListViewState = .initial
  
  // MARK: UI
  
  @IBOutlet weak var tableView: UITableView!
  var loadingView: UIView!
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    setupBinding()
    
    presenter?.viewDidLoad()
  }
  
  
  private func setupUI() {
    loadingView = UIView()
    loadingView.translatesAutoresizingMaskIntoConstraints = false
    loadingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
  }
  
  private func setupBinding() {
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.tableFooterView = UIView()
  }
  
  private func addLoadingView() {
    view.addSubview(loadingView)
    loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    
    loadingView.addSubview(activityIndicatorView)
    
    activityIndicatorView.topAnchor.constraint(equalTo: loadingView.topAnchor).isActive = true
    activityIndicatorView.bottomAnchor.constraint(equalTo: loadingView.bottomAnchor).isActive = true
    activityIndicatorView.leadingAnchor.constraint(equalTo: loadingView.leadingAnchor).isActive = true
    activityIndicatorView.trailingAnchor.constraint(equalTo: loadingView.trailingAnchor).isActive = true
    
    activityIndicatorView.startAnimating()
  }
  
  private func removeLoadingView() {
    loadingView.removeFromSuperview()
  }
  
}


// MARK: - CityListViewProtocol

extension CityListViewController: CityListViewProtocol {
  
  func showLoadingScreen() {
    state = .loading
    
    addLoadingView()
    
    UIView.animate(withDuration: 0.2) {
      self.view.layoutIfNeeded()
    }
  }
  
  func show() {
    state = .loaded
    
//    removeLoadingView()
  }
  
}


// MARK: - UITableViewDelegate

extension CityListViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("didSelectRowAt \(indexPath.row)")
  }
  
}


// MARK: - UITableViewDataSource

extension CityListViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    return cell
  }
  
}

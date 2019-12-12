//
//  UserActivityViewController.swift
//  KisanHub
//
//  Created by Praful Mahajan on 11/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import UIKit

//**************************************************
// MARK: - UserActivityViewController Class
//**************************************************
class UserActivityViewController: UIViewController {

    //**************************************************
    // MARK: - Properties
    //**************************************************
    var userActivityViewModel: UserActivityViewModel?

    //**************************************************
    // MARK: - @IBOutlet
    //**************************************************
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    //**************************************************
    // MARK: - Constant
    //**************************************************
    enum Constant {
        static let cellHeight: CGFloat = 112.0
    }

    //**************************************************
    // MARK: - View life cycle methods
    //**************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewModel()
    }

    //**************************************************
    // MARK: - Private methods
    //**************************************************
    private func initializeViewModel() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        userActivityViewModel = UserActivityViewModel.init()
        userActivityViewModel?.delegate = self
    }

    //**************************************************
    // MARK: -  @IBAction Methods
    //**************************************************
    @IBAction func logoutAction(_ sender: Any) {
        LocalStore.removeAllLocalStore()
        if let viewController = CommonMethods.getViewControllerFromStoryBoard(type: LoginViewController.self, storyBoard: .MAIN) {
            CommonMethods.setRootViewController(viewController: viewController)
        }
    }
}

//**************************************************
// MARK: - ViewModelToViewLoginProtocol Methods
//**************************************************
extension UserActivityViewController: ViewModelToViewLoginProtocol {
    func isSccuess() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
    }

    func isFailed() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
}

//**************************************************
// MARK: - UITableViewDataSource Methods
//**************************************************
extension UserActivityViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userActivityViewModel?.activities.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserActivityCell.cellIdentifier, for: indexPath) as! UserActivityCell
        cell.selectionStyle = .none
        let activity = self.userActivityViewModel?.activities[indexPath.row]
        cell.configuredCell(activity: activity)
        return cell
    }
}

//**************************************************
// MARK: - UITableViewDelegate Methods
//**************************************************
extension UserActivityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.cellHeight
    }
}

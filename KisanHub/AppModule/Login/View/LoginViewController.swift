//
//  LoginViewController.swift
//  KisanHub
//
//  Created by Praful Mahajan on 10/12/19.
//  Copyright © 2019 prafulmahajan. All rights reserved.
//

import UIKit

//**************************************************
// MARK: - LoginViewController Class
//**************************************************
class LoginViewController: UIViewController {

    //**************************************************
    // MARK: - @IBOutlet
    //**************************************************
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: ActionButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    //**************************************************
    // MARK: - Properties
    //**************************************************
    var loginViewModel: LoginViewModel?

    //**************************************************
    // MARK: - Constant
    //**************************************************
    enum Constant {
        static let themeColor: UIColor = UIColor(hexString: "59B34E")
        static let whiteColor: UIColor = .white
    }
    
    //**************************************************
    // MARK: - View life cycle methods
    //**************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLoginViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    //**************************************************
    // MARK: - private methods
    //**************************************************
    private func initializeLoginViewModel() {
        loginViewModel = LoginViewModel()
        activityIndicator.isHidden = true
        setLoginButtonColor(isClicked: false)
    }
    
    private func setLoginButtonColor(isClicked: Bool) {
        if isClicked {
            loginButton.backgroundColor = Constant.themeColor
            loginButton.setTitleColor(Constant.whiteColor, for: .normal)
            loginButton.borderWidth = 1.0
            loginButton.isUserInteractionEnabled = false
        }
        else {
            loginButton.backgroundColor = Constant.whiteColor
            loginButton.setTitleColor(Constant.themeColor, for: .normal)
            loginButton.borderWidth = 0.0
            loginButton.isUserInteractionEnabled = true
        }
    }

    private func showErrorTextField(textFieldType: TextFieldType?) {
        switch textFieldType {
        case .USERNAME:
            userNameTextField.becomeFirstResponder()
            break
        case .PASSWORD:
            passwordTextField.becomeFirstResponder()
            break
        default:
            break
        }
    }

    private func showUserActivityView() {
        DispatchQueue.main.async {
            guard let viewController = CommonMethods.getViewControllerFromStoryBoard(type: UINavigationController.self, storyBoard: .MAIN) else { return }
            CommonMethods.setRootViewController(viewController: viewController)
        }
    }

    //**************************************************
    // MARK: - @IBAction Methods
    //**************************************************
    @IBAction func loginAction(_ sender: Any) {
        setLoginButtonColor(isClicked: true)
        self.view.endEditing(true)
        let userName = userNameTextField.text
        let password = passwordTextField.text
        let responseTupple = loginViewModel?.validateLoginCredentials(userName: userName, password: password)
        guard let isValid = responseTupple?.0, isValid else {
            setLoginButtonColor(isClicked: false)
            let message = responseTupple?.1
            let textFieldType = responseTupple?.2
            showAlert(withMessage: message)
            showErrorTextField(textFieldType: textFieldType)
            return
        }
        setLoginButtonColor(isClicked: true)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        loginViewModel?.setLoginRequestModel(userName: userName, password: password)
        loginViewModel?.getUserToken {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.setLoginButtonColor(isClicked: false)
            }
            guard let userToken = self.loginViewModel?.loginResponseModel?.userToken else { return }
            if userToken.count > 0 {
                self.showUserActivityView()
            }
        }
    }
}

//**************************************************
// MARK: - UITextFieldDelegate Methods
//**************************************************
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
        return true
    }
}

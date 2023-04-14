//
//  LoginViewControllerMVVM.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 09/04/23.
//

import Foundation
import UIKit

final class LoginViewControllerMvvm: UIViewController,
                                    UITextFieldDelegate {
    // MARK: - UI

    var viewModel: LoginViewModel!

    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter mail id"
        textField.borderStyle = .roundedRect
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        return textField
    }()

    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    let errorDescription: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "You can enter text now"
        uilabel.textColor = .green
        uilabel.font.withSize(15)
        return uilabel
    }()

    let titleLabel: UILabel = {
        let uilabel = UILabel()
        uilabel.text = "MVVM"
        uilabel.textColor = .green
        uilabel.font.withSize(15)
        return uilabel
    }()

    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.layer.cornerRadius = 0.8
        stackView.backgroundColor = .black
        return stackView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        setupUI()
    }


    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .systemIndigo
        self.viewModel.bindViewModelToController = {
            self.errorDescription.text = self.viewModel.errorDescription
            self.errorDescription.textColor = self.viewModel.errorDescriptionColor
        }
        configureStackView()
        loginTextField.delegate = self
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }

    private func configureStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(errorDescription)
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
        ])
    }

    // MARK: - Text Field Delegate

    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorDescription.textColor = .gray
    }

    // MARK: - Actions

    @objc
    private func didTapLoginButton() {
        viewModel.didTapLoginButton(email: loginTextField.text,
                                     password: passwordTextField.text)
    }
}



/*
 MARK: - What changed
 - All responsibilities of business logic is now shifted to View Model
 - Which means you can use the business logic anywhere
 - VC owns View model
 - View model knows nothing about the View
 - It has all the states of the elements in the app
 - Less code
 - We can now monitor the state of these components in other parts of the app
 */
/*

 MARK: - RESPONSIBILITIES:
 - Responsibilities of VC includes
   - Handling Actions of UI Items
   - Creating UI Items
   - Configuring UI ITems
   - Lifecycle
   - Creating View model
 */

/*
MARK: - Rating in terms of Requirements:
 Readability - 3/5
 Testability - 3/5
    - We can test Business validation Logic
    - We can test UI If needed
    - We can test Database if needed, Everything is created in its own class, But we can test the saving logic etc.

 Maintainability / Extendability / Flexibility - 3.5/5
   - Can't scale well because
   - Creation of objects is handled by VC
   - Routing can be a problem when it comes to MVVM
   - Dependencies Injection are an issues
 */


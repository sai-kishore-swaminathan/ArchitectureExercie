//
//  LoginViewControllerMVP.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 09/04/23.
//

import Foundation
import UIKit

/*
 With MVP we just make the business logic independent

 */

final class LoginViewControllerMvp: UIViewController,
                                    UITextFieldDelegate,
                                    LoginViewInputMvp {
    // MARK: - UI

    var presenter: LoginViewOutputMvp?

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
        uilabel.text = "MVP"
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
        // Does not hold any reference to model, just creates Login Model
        presenter = LoginPresenterMvp(view: self, model: LoginModel(networkService: NetworkService.shared))
        setupUI()
    }


    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .systemTeal
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
        presenter?.didTapLoginButton(email: loginTextField.text,
                                     password: passwordTextField.text)
    }

    //MARK: - LoginViewInputMvp

    func didObtainValidationResult(result: ValidationResult) {
        switch result {
        case .invalidEmail:
            errorDescription.text = "This is not a valid mail id"
            errorDescription.textColor = .red
        case .invalidLength:
            errorDescription.text = "This is not a valid mail length"
            errorDescription.textColor = .red
        case .invalidPassword:
            errorDescription.text = "This is not a valid password"
            errorDescription.textColor = .red
        case .success:
            errorDescription.text = "Login successful"
            errorDescription.textColor = .green
        case .empty:
            errorDescription.text = "Enter all Fields"
            errorDescription.textColor = .green
        }
    }
}



/*
 MARK: - What changed
 - All responsibilities of business logic is now shifted to Presenter
 - Which means you can use the business logic anywhere
 - VC stil owns presenter
 */



/*

 MARK: - RESPONSIBILITIES:
 - Responsibilities of VC includes
   - Handling Actions of UI Items
   - Creating UI Items
   - Configuring UI ITems
   - Lifecycle

- Presenter
  - Handles Logic
  - Handles Managing other related services
 */

/*
MARK: - Rating in terms of Requirements:
 Readability - 3/5
 Testability - 3/5
    - We can test Business validation Logic
    - We can test UI If needed
    - We can test Database if needed, Everything is created in its own class, But we can test the saving logic etc.

 Maintainability / Extendability / Flexibility - 2.5/5
   - Can't scale well because
   - Creation of objects is handled by VC
   - View still has reference to Presenter ( if you want to use a different presenter at run time then it might be a problem
   - We have to remember to write a lot of code + protocols to update things
   - Presenter is coupled with a view so you cannot re use it to monitor the states
 */


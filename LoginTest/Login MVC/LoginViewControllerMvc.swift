//
//  ViewController.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 02/04/23.
//

/* MARK: - Task
 Design a Login UI Module using an architecture of your taste.

 Task Requirements:
 - Have a high testability
 - Have a high flexiblity
 - Have a high readability

 Code
 UI Requirements: Email text field, Password text field, Sign In button.
 Logic Requirements: Validate email field

 Step 1: Pick any architecture you like the most
 Step 2: Define Layers/Classes you want to introduce
 Step 3: Define Interfaces of each layer
 Step 4: Connect them together
*/

import UIKit

final class LoginViewControllerMvc: UIViewController, UITextFieldDelegate {

    // MARK: - UI

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
        uilabel.text = "MVC"
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
        setupUI()
    }


    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .gray
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
        // implement me
        if Validator.isValidEmail(loginTextField.text ?? "") {
            errorDescription.text = "Login successful"
            errorDescription.textColor = .green
        } else {
            errorDescription.text = "This is not a valid mail id"
            errorDescription.textColor = .red
        }
        // Other common responsibilities after clicking login

        // Login info Validation ( Network calls )
        // Storing information to DB ( DB objects )
        // Fetching stuff from APIs (Different Services)
        // Re routing to different module (Calling different modules )
    }
}


/*

 MARK: - RESPONSIBILITIES:
 - Responsibilities of VC includes
   - Initialising + using Services
   - Handling Actions of UI Items
   - Creating UI Items
   - Configuring UI ITems
   - Business Logic ( Validation )
   - Lifecycle
 */

/*
MARK: - Rating in terms of Requirements:
 Readability - 1/5
 Testability - 2.5/5
    - We can test Business validation Logic Seprataely
    - We can test UI If needed
    - We can test Database if needed, Everything is created in its own class
 Maintainability / Extendability / Flexibility - 1/5
    - They are tightly coupled, changes in one can affect another
    - No rules
    - Cannot reuse elements like UI / Logic etc
 */

/*

 - MARK: - VC Problems
  - Cannot resue Validation logic / UI in other screens
  - too hard to read and maintain
 */

/*
 MARK: - How to solve it
    - Splitting reponsibilities one by one ( things that could change )
    - Next up -> MVP
 */

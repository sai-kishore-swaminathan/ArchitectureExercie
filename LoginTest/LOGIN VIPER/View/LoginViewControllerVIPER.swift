//
//  LoginViewControllerVIPER.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 12/04/23.
//

import UIKit

final class LoginViewControllerViper: UIViewController, UITextFieldDelegate, LoginViewViperInput {

    var presenter: LoginViewViperOutput?

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
        uilabel.text = "VIPER"
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
        view.backgroundColor = .systemOrange
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
        presenter?.didTapLoginButton(text: loginTextField.text)
    }

    // MARK: - Login View Input

    func didFinishValidation(text: String, color: UIColor) {
        errorDescription.text = text
        errorDescription.textColor = color
    }

}

//
//  LoginRouterViper.swift
//  LoginTest
//
//  Created by Sai Kishore Swaminathan on 12/04/23.
//

import Foundation


final class LoginRouterViper: LoginViperRouterInput {

    static func createModule() -> LoginViewControllerViper {
        let view = LoginViewControllerViper()

        let presenter: LoginViewViperOutput & LoginPresenterViperInput = LoginPresenterViper()
        let interactor: LoginPresenterViperOutput = LoginInteractorViper()
        let router: LoginViperRouterInput = LoginRouterViper()

        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view 
        presenter.interactor  = interactor
        presenter.router = router

        return view
    }

    public func didFinishLogin() {
        // Route to a different screen
    }
}

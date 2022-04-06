//
//  SignInViewController.swift
//  Instagram_Clone
//
//  Created by 정은희 on 2022/04/04.
//

import UIKit

final class SignInViewController: BaseViewController {
    
    // MARK: - Properties
    private let signInView = SignInView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchUpToGoSignUpView()
    }

    override func loadView() {
        view = signInView
    }
    
    // MARK: - Functions
    override func setTargets() {
        super.setTargets()
        
        [signInView.idTextField, signInView.passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        }
        signInView.signUpButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
    }
    
    @objc
    private func textFieldDidChanged(_ textField: UITextField) {
        signInView.signUpButton.isEnabled = (signInView.idTextField.hasText || signInView.passwordTextField.hasText) ? true : false
    }
    
    @objc
    private func signInButtonClicked() {
        let nextVC = WelcomeViewController.instanceFromNib()
        nextVC.userName = signInView.idTextField.text
        nextVC.modalTransitionStyle = .crossDissolve
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true)
    }
    
    private func touchUpToGoSignUpView() {
        let nextVC = SignUpFirstViewController.instanceFromNib()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

//
//  SignUpFirstViewController.swift
//  Instagram_Clone
//
//  Created by 정은희 on 2022/04/06.
//

import UIKit

final class SignUpFirstViewController: BaseViewController {
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var signUpFirstView: SignUpView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        assignDelegation()
    }
    
    // MARK: - Functions
    override func setNavigation() {
        super.setNavigation()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func setStyle() {
        super.setStyle()
        
        signUpFirstView.titleLabel.text = "사용자 이름 만들기"
        signUpFirstView.descriptionLabel.text = """
        새 계정에 사용할 사용자 이름을 선택하세요. 나중에
        언제든지 변경할 수 있습니다.
        """
        signUpFirstView.inputTextField.placeholder = "사용자 이름"
    }
    
    private func assignDelegation() {
        signUpFirstView.delegate = self
    }
}

extension SignUpFirstViewController: SignUpViewDelegate {
    internal func dismissButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    internal func nextButtonClicked() {
        let nextVC = SignUpSecondViewController.instanceFromNib()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

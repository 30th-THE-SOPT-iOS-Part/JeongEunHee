//
//  WelcomeViewController.swift
//  Instagram_Clone
//
//  Created by 정은희 on 2022/04/06.
//

import UIKit

final class WelcomeViewController: BaseViewController {
    
    // MARK: - Properties
    private let welcomeView = WelcomeView()
    public var userName: String?

    // MARK: - View Life Cycle
    override func loadView() {
        view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUserName()
    }
    
    // MARK: - Functions
    override func setTargets() {
        super.setTargets()
        
        welcomeView.doneButton.addTarget(self, action: #selector(addDissmiss), for: .touchUpInside)
    }
    
    @objc
    private func addDissmiss() {
        self.dismiss(animated: true) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    private func setUserName() {
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            welcomeView.welcomeLabel.text = """
            \(userName)님 Instagram에
            오신 것을 환영합니다
            """
        }
    }
}

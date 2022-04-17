//
//  BaseViewController.swift
//  Instagram_Clone
//
//  Created by 정은희 on 2022/04/04.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setHierarchy()
        setNavigation()
        setStyle()
        setTargets()
    }
    
    // MARK: - Functions
    public func setHierarchy() { }
    public func setNavigation() { }
    public func setStyle() { }
    public func setTargets() { }
}
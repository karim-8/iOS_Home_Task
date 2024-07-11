//
//  SplashScreenViewController.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    //MARK:- PROPERTIES
    private var viewModel: SplashScreenViewModel?
    private var coordinator = SplashScreenCoordinator()

    //MARK:- VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    //MARK:- SETUP VIEW
    func setupView() {
        viewModel = SplashScreenViewModel(coordinator: coordinator, viewController: self)
    }

    //MARK:- HIDE STATUS BAR
    override var prefersStatusBarHidden: Bool {
        return true
    }

    //MARK:- DEINIT
    deinit {
        viewModel = nil
    }
}

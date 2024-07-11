//
//  SplashScreenCoordinator.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import UIKit
import Foundation

protocol SplashScreenCoordinatorProtocol {
    func navigateTo(view: UIViewController)
}

class SplashScreenCoordinator: SplashScreenCoordinatorProtocol {
    
    //MARK:- PROPERTIES
    let listHomeCoordinator = HomeCoordinator()
    
    //MARK:- NAVIGATE TO
    func navigateTo(view: UIViewController) {
        
        let viewModel: HomeViewModel =
        HomeViewModel(coordinator: listHomeCoordinator)
        
        //Instiantiate The Storyboard
        let listHomeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "home") as? HomeViewController
        
        listHomeViewController?.viewModel = viewModel
        
        //Navigate to List Home Screen
        if let vc = listHomeViewController {
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .crossDissolve
            view.present(navigationController, animated: true)
        }
    }
}

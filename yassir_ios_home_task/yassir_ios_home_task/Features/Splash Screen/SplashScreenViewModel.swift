//
//  SplashScreenViewModel.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 06/07/2024.
//

import Foundation
import UIKit

class SplashScreenViewModel {
    
    // MARK:- PROPERTIES
    private let coordinator: SplashScreenCoordinator
    private let viewController: UIViewController
    
    // MARK:- INIT
    init(coordinator: SplashScreenCoordinator, viewController: UIViewController) {
        self.coordinator = coordinator
        self.viewController = viewController
        navigateTo()
    }

    //MARK:- NAVIGATE TO
    func navigateTo() {
        // Keep the animation for 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.coordinator.navigateTo(view: self.viewController)
        })
    }
}

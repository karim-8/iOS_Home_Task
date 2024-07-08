//
//  NavigationBarHelper.swift
//  Yassir-Home-Task
//
//  Created by Karim Soliman on 07/07/2024.
//

import UIKit

//MARK:- NAVIGATION BAR SETUP
func navigationBarSetup(navigationController: UINavigationController) {
        // backgorund color with gradient
    UINavigationBar.appearance().backgroundColor = .white
        //Change the navigation bar title color
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        // Change to bigger title
    navigationController.navigationBar.prefersLargeTitles = true
}
